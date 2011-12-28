# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CommentsController do

  describe "POST 'create'" do
    before(:each) do
      @post = Factory(:post)
      @comment = { :body => "Great post!",
                   :url => "http://www.daviferreira.com",
                   :email => "contato@daviferreira.com",
                   :author => "Davi Ferreira",
                   :post_id => @post.id }
    end

    it "should accept a valid comment" do
      lambda do
        post :create, :comment => @comment, :format => :js
      end.should change(Comment, :count).by(1)
    end

    it "should publish a valid comment" do
      Comment.any_instance.stub(:spam?).and_return(false)
      post :create, :comment => @comment, 
                    :format => :js
      Comment.last.published.should be_true
    end

    it "should highlight owner comment" do
      
    end
    
    it "should nest a comment reply" do
      
    end

  end

end
