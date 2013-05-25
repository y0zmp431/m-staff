require 'spec_helper'

describe "banners/show" do
  before(:each) do
    @banner = assign(:banner, stub_model(Banner,
      :target_url => "Target Url",
      :title => "Title",
      :content => "MyText",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Target Url/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
