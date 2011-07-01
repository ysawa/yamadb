require 'spec_helper'

describe "items/index.html.haml" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :code => "Code",
        :name => "Name",
        :content => "Content"
      ),
      stub_model(Item,
        :code => "Code",
        :name => "Name",
        :content => "Content"
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
