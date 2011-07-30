require 'spec_helper'
include FakeWebHelper

describe "Peaks" do
  before(:each) do
    fake_search_twitter
    fake_wunderground_forecast
  end

  describe "GET /peaks" do
    it 'shows list of peaks' do
      @peak = Fabricate(:peak)
      visit peaks_path
      page.should have_content(@peak.name)
    end
  end

  describe "GET /peaks/1" do
    it 'shows list of peaks' do
      @peak = Fabricate(:peak)
      visit peak_path(@peak)
      page.should have_content(@peak.name)
    end
  end
end
