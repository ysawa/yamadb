require 'spec_helper'

describe "equipments/index.html.haml" do
  before(:each) do
    assign(:equipments, [
      stub_model(Equipment,
        :name => "Name",
        :content => "MyText"
      ),
      stub_model(Equipment,
        :name => "Name",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of equipments" do
    render
  end
end
