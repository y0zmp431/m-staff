require 'spec_helper'

describe "banners/new" do
  before(:each) do
    assign(:banner, stub_model(Banner,
      :target_url => "MyString",
      :title => "MyString",
      :content => "MyText",
      :published => false
    ).as_new_record)
  end

  it "renders new banner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", banners_path, "post" do
      assert_select "input#banner_target_url[name=?]", "banner[target_url]"
      assert_select "input#banner_title[name=?]", "banner[title]"
      assert_select "textarea#banner_content[name=?]", "banner[content]"
      assert_select "input#banner_published[name=?]", "banner[published]"
    end
  end
end
