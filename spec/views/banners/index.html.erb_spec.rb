require 'spec_helper'

describe "banners/index" do
  before(:each) do
    assign(:banners, [
      stub_model(Banner,
        :target_url => "Target Url",
        :title => "Title",
        :content => "MyText",
        :published => false
      ),
      stub_model(Banner,
        :target_url => "Target Url",
        :title => "Title",
        :content => "MyText",
        :published => false
      )
    ])
  end

  it "renders a list of banners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Target Url".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
