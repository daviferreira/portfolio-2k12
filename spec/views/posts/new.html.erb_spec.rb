require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
    assign(:post, stub_model(Post,
      :title => "MyString",
      :abstract => "MyText",
      :body => "MyText",
      :meta_title => "MyString",
      :meta_description => "MyString",
      :block_comments => false,
      :published => false
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
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
