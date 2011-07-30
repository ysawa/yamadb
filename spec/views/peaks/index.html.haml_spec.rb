require 'spec_helper'
include FakeWebHelper

describe "peaks/index.html.haml" do
  before(:each) do
    fake_search_twitter
    fake_wunderground_forecast
    @peak = Fabricate(:peak)
    assign(:peaks, Peak.all.page(1))
  end

  it "renders a list of peaks" do
    render
  end
end
