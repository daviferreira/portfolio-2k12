require 'spec_helper'

describe "comments/edit.html.erb" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :author => "MyString",
      :email => "MyString",
      :url => "MyString",
      :body => "MyText",
      :post_id => 1,
      :published => false
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "input#comment_author", :name => "comment[author]"
      assert_select "input#comment_email", :name => "comment[email]"
      assert_select "input#comment_url", :name => "comment[url]"
      assert_select "textarea#comment_body", :name => "comment[body]"
      assert_select "input#comment_post_id", :name => "comment[post_id]"
      assert_select "input#comment_published", :name => "comment[published]"
    end
  end
end
