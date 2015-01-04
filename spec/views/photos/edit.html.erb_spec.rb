require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :disabled => false,
      :index_of_order => 1
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do
      assert_select "input#photo_disabled[name=?]", "photo[disabled]"
      assert_select "input#photo_index_of_order[name=?]", "photo[index_of_order]"
    end
  end
end
