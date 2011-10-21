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
      class ActionController::Request
        def remote_ip
          '192.178.33.4'
        end
      end
    end

    it "should accept a valid comment" do
      lambda do
        post :create, :comment => @comment, :format => :js
      end.should change(Comment, :count).by(1)
    end

    it "should block spams" do
      post :create, :comment => @comment.merge({:body => "Viagra"}), 
                    :format => :js
      Comment.last.published.should be_false
    end

    it "should block spams" do
      post :create, :comment => @comment, 
                    :format => :js
      debugger
      Comment.last.published.should be_true
    end

  end

end
