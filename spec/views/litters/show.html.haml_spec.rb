require 'rails_helper'

RSpec.describe "litters/show", :type => :view do
  before(:each) do
    @litter = assign(:litter, Litter.create!(
      :litter_sym => "Litter Sym"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Litter Sym/)
  end
end
