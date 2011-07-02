require 'spec_helper'

describe "peaks/show.html.haml" do
  before(:each) do
    @peak = assign(:peak, stub_model(Peak,
      :name => "Name",
      :location => [],
      :altitude => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
