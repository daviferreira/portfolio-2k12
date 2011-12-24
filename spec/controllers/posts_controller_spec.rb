# -*- encoding : utf-8 -*-
require 'spec_helper'
include ActionView::Helpers::DateHelper

describe PostsController do

  render_views

  describe "GET 'index'" do
    
    before(:each) do
      @post = Factory(:post)
      tableless_post = Factory(:post, :title => 'Tableless post', :tableless => 'http://www.tableless.com.br/')
      unpublished_post = Factory(:post, :title => 'Not published', :published => false)
      blocked_comments_post = Factory(:post, :title => 'Blocked comments', :block_comments => true)
    end
    
    it "should be successful" do
			get :index
			response.should be_success
    end
    
    it "should list only published posts" do
      get :index
      Post.all.each do |post|
        if post.published?
          response.should have_selector('a', :content => post.title)
        else
          response.should_not have_selector('a', :content => post.title)
        end
      end
    end
    
    it "should display post published date" do
      get :index
      Post.published.all.each do |post|
        response.should have_selector('p.time-ago', :content => time_ago_in_words(post.published_date))
      end
    end
    
    it "should display 'tableless' label for tableless posts" do
      get :index
      response.should have_selector('span', :content => 'Tableless')
    end
    
    it "sholud display posts comments count" do
      get :index
    end
    
    it "should not display posts comments from posts with blocked comments" do
      get :index
    end
    
  end
  
  describe "GET 'show'" do
    
  end
  
  describe "GET 'feed'" do
    
  end
  
  describe "GET 'feed_comments'" do
    
  end

end
