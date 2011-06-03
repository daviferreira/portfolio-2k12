require 'spec_helper'

describe "projects/edit.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "MyString",
      :description => "MyText",
      :url => "MyString",
      :category_id => 1,
      :published => false
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_url", :name => "project[url]"
      assert_select "input#project_category_id", :name => "project[category_id]"
      assert_select "input#project_published", :name => "project[published]"
    end
  end
end
