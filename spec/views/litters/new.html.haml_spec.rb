require 'rails_helper'

RSpec.describe "litters/new", :type => :view do
  before(:each) do
    assign(:litter, Litter.new(
      :litter_sym => "MyString"
    ))
  end

  it "renders new litter form" do
    render

    assert_select "form[action=?][method=?]", litters_path, "post" do

      assert_select "input#litter_litter_sym[name=?]", "litter[litter_sym]"
    end
  end
end
