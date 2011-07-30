require 'spec_helper'
include FakeWebHelper

describe "peaks/show.html.haml" do
  before(:each) do
    fake_search_twitter
    fake_wunderground_forecast
    @peak = Fabricate(:peak)
    assign(:peak, @peak)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(@peak.name)
  end
end
