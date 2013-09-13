require 'spec_helper'

describe "dogs/index" do
  before(:each) do
    assign(:dogs, [
      stub_model(Dog,
        :url => "Url",
        :name => "Name",
        :fullname => "Fullname",
        :male => false,
        :for_sale => false,
        :for_love => false,
        :from_us => false,
        :desc => "MyText",
        :pedigree => "Pedigree",
        :disabled => false,
        :owner_desc => "MyText"
      ),
      stub_model(Dog,
        :url => "Url",
        :name => "Name",
        :fullname => "Fullname",
        :male => false,
        :for_sale => false,
        :for_love => false,
        :from_us => false,
        :desc => "MyText",
        :pedigree => "Pedigree",
        :disabled => false,
        :owner_desc => "MyText"
      )
    ])
  end

  it "renders a list of dogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Fullname".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Pedigree".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
