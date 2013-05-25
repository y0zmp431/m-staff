require 'spec_helper'

describe "banners/edit" do
  before(:each) do
    @banner = assign(:banner, stub_model(Banner,
      :target_url => "MyString",
      :title => "MyString",
      :content => "MyText",
      :published => false
    ))
  end

  it "renders the edit banner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", banner_path(@banner), "post" do
      assert_select "input#banner_target_url[name=?]", "banner[target_url]"
      assert_select "input#banner_title[name=?]", "banner[title]"
      assert_select "textarea#banner_content[name=?]", "banner[content]"
      assert_select "input#banner_published[name=?]", "banner[published]"
    end
  end
end
