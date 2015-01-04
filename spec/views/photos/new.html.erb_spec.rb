require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :disabled => false,
      :index_of_order => 1
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#photo_disabled[name=?]", "photo[disabled]"
      assert_select "input#photo_index_of_order[name=?]", "photo[index_of_order]"
    end
  end
end
