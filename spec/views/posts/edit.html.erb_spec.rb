require 'spec_helper'

describe "posts/edit.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title => "MyString",
      :abstract => "MyText",
      :body => "MyText",
      :meta_title => "MyString",
      :meta_description => "MyString",
      :block_comments => false,
      :published => false
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "input#post_title", :name => "post[title]"
      assert_select "textarea#post_abstract", :name => "post[abstract]"
      assert_select "textarea#post_body", :name => "post[body]"
      assert_select "input#post_meta_title", :name => "post[meta_title]"
      assert_select "input#post_meta_description", :name => "post[meta_description]"
      assert_select "input#post_block_comments", :name => "post[block_comments]"
      assert_select "input#post_published", :name => "post[published]"
    end
  end
end
