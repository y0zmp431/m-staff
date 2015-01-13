require 'rails_helper'

RSpec.describe "litters/edit", :type => :view do
  before(:each) do
    @litter = assign(:litter, Litter.create!(
      :litter_sym => "MyString"
    ))
  end

  it "renders the edit litter form" do
    render

    assert_select "form[action=?][method=?]", litter_path(@litter), "post" do

      assert_select "input#litter_litter_sym[name=?]", "litter[litter_sym]"
    end
  end
end
