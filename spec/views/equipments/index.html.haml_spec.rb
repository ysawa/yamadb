require 'spec_helper'

describe "equipments/index.html.haml" do
  before(:each) do
    @equipment = Fabricate(:equipment)
    assign(:equipments, Equipment.all.page(1))
  end

  it "renders a list of equipments" do
    render
  end
end
