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
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
