require 'spec_helper'

describe ProjectsController do

  render_views

  describe "GET 'index'" do
    
    it "should be successful" do
      get 'index'
      response.should  be_success
    end
    
    it "should show the latest projects" do
      c1 = Factory(:category, :name => "Category 1")
      p1 = Factory(:project, :name => "Project 1", :description => "Description 1")
      p2 = Factory(:project, :name => "Project 2", :description => "Description 2")
      get :index
      response.should have_selector('h3', :content => p1.name)
      response.should have_selector('p', :content => p1.description)
      response.should have_selector('h3', :content => p2.name)
      response.should have_selector('p', :content => p2.description)
    end
    
    it "should show the latest blog posts" do
      p1 = Factory(:post, :title => "Foo", :body => "Bar", :abstract => "FooBar")
      p2 = Factory(:post, :title => "Bar", :body => "Foo", :abstract => "BarFoo")
      get :index
      response.should have_selector('h3', :content => p1.title)
      response.should have_selector('p.abstract', :content => p1.abstract)
      response.should have_selector('h3', :content => p2.title)
      response.should have_selector('p.abstract', :content => p2.abstract)
    end
    
  end

end
