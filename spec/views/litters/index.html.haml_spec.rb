require 'rails_helper'

RSpec.describe "litters/index", :type => :view do
  before(:each) do
    assign(:litters, [
      Litter.create!(
        :litter_sym => "Litter Sym"
      ),
      Litter.create!(
        :litter_sym => "Litter Sym"
      )
    ])
  end

  it "renders a list of litters" do
    render
    assert_select "tr>td", :text => "Litter Sym".to_s, :count => 2
  end
end
