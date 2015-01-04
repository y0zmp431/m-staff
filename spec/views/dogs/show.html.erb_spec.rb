require 'spec_helper'

describe "dogs/show" do
  before(:each) do
    @dog = assign(:dog, stub_model(Dog,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/Name/)
    rendered.should match(/Fullname/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
    rendered.should match(/Pedigree/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
  end
end
