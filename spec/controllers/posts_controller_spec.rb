# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PostsController do
  render_views

  describe "GET 'index'" do
    before(:each) do
      @post = Factory(:post)
      @post_in_english = Factory(:post, :title => "Post in english", :locale => "en")
    end
    
    it "should list posts in portuguese without a locale" do
      get :index
      response.should have_selector("a", :content => @post.title)
      response.should_not have_selector("a", :content => @post_in_english.title)
    end

    it "should list posts in english with locale as 'en'" do
      get :index, :locale => 'en'
      response.should have_selector("a", :content => @post_in_english.title)
      response.should_not have_selector("a", :content => @post.title)      
    end
    
    it "should list posts in portuguese with an invalid locale" do
      get :index, :locale => 'invalid'
      response.should have_selector("a", :content => @post.title)
      response.should_not have_selector("a", :content => @post_in_english.title)
    end

  end

  describe "GET 'show'" do

    before(:each) do
      @first_post = Factory(:post)
      @second_post = Factory(:post, :title => "Second Post", :published_date => '2011-01-01 12:12:12')
      @third_post = Factory(:post, :title => "Third Post", :published_date => '2011-01-01 13:13:13')
      @fourth_post = Factory(:post, :title => "Tableless Post", :published_date => '2011-01-01 14:14:14', :tableless => 'http://www.tableless.com.br')
      @fifth_post = Factory(:post, :title => "Fifth Post", :published_date => '2011-01-01 15:15:15')
    end

    it "should be successful" do
      get :show, :id => @first_post.id
      response.should be_success
    end

    it "should find the right post" do
      get :show, :id => @first_post.id
      assigns(:post).should == @first_post
    end

    it "should show the previous post when there is one" do
      get :show, :id => @third_post.id
      response.should have_selector("a", :class => 'prev', :content => @second_post.title)
      response.should have_selector("span", :content => "←")
    end

    it "should not show previous post when there isn't one" do
      get :show, :id => @first_post.id
      response.should_not have_selector("a", :class => 'prev')
      response.should_not have_selector("span", :content => "←")
    end

    it "should show the next post when there is one" do
      get :show, :id => @first_post.id
      response.should have_selector("a", :class => 'next', :content => @second_post.title)
      response.should have_selector("span", :content => "→")
    end

    it "should not show next post when there isn't one" do
      get :show, :id => @fifth_post.id
      response.should_not have_selector("a", :class => 'next')
      response.should_not have_selector("span", :content => "→")
    end

    it "should show both previous and next post" do
      get :show, :id => @second_post.id
      response.should have_selector("a", :class => 'prev', :content => @first_post.title)
      response.should have_selector("span", :content => "←")
      response.should have_selector("a", :class => 'next', :content => @third_post.title)
      response.should have_selector("span", :content => "→")
    end

    it "should ignore tableless posts on previous or next post" do
      get :show, :id => @third_post.id
      response.should have_selector("a", :class => 'prev', :content => @second_post.title)
      response.should have_selector("span", :content => "←")
      response.should have_selector("a", :class => 'next', :content => @fifth_post.title)
      response.should have_selector("span", :content => "→")
    end

  end
end
