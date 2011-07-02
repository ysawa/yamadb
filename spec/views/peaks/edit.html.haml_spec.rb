require 'spec_helper'

describe "peaks/edit.html.haml" do
  before(:each) do
    @peak = assign(:peak, stub_model(Peak,
      :name => "MyString",
      :location => [],
      :altitude => 1
    ))
  end

  it "renders the edit peak form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => peaks_path(@peak), :method => "post" do
      assert_select "input#peak_name", :name => "peak[name]"
      assert_select "input#peak_altitude", :name => "peak[altitude]"
    end
  end
end
