require 'spec_helper'

describe "peaks/index.html.haml" do
  before(:each) do
    assign(:peaks, [
      stub_model(Peak,
        :name => "Name",
        :location => [],
        :altitude => 1
      ),
      stub_model(Peak,
        :name => "Name",
        :location => [],
        :altitude => 1
      )
    ])
  end

  it "renders a list of peaks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
