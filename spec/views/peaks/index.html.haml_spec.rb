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
  end
end
