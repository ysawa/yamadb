require 'spec_helper'

describe "peaks/index.html.haml" do
  before(:each) do
    @peak = Fabricate(:peak)
    assign(:peaks, Peak.all.page(1))
  end

  it "renders a list of peaks" do
    render
  end
end
