require 'spec_helper'

describe "dogs/new" do
  before(:each) do
    assign(:dog, stub_model(Dog,
      :url => "MyString",
      :name => "MyString",
      :fullname => "MyString",
      :male => false,
      :for_sale => false,
      :for_love => false,
      :from_us => false,
      :desc => "MyText",
      :pedigree => "MyString",
      :disabled => false,
      :owner_desc => "MyText"
    ).as_new_record)
  end

  it "renders new dog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dogs_path, "post" do
      assert_select "input#dog_url[name=?]", "dog[url]"
      assert_select "input#dog_name[name=?]", "dog[name]"
      assert_select "input#dog_fullname[name=?]", "dog[fullname]"
      assert_select "input#dog_male[name=?]", "dog[male]"
      assert_select "input#dog_for_sale[name=?]", "dog[for_sale]"
      assert_select "input#dog_for_love[name=?]", "dog[for_love]"
      assert_select "input#dog_from_us[name=?]", "dog[from_us]"
      assert_select "textarea#dog_desc[name=?]", "dog[desc]"
      assert_select "input#dog_pedigree[name=?]", "dog[pedigree]"
      assert_select "input#dog_disabled[name=?]", "dog[disabled]"
      assert_select "textarea#dog_owner_desc[name=?]", "dog[owner_desc]"
    end
  end
end
