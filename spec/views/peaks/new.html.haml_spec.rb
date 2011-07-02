require 'spec_helper'

describe "peaks/new.html.haml" do
  before(:each) do
    assign(:peak, stub_model(Peak,
      :name => "MyString",
      :location => [],
      :altitude => 1
    ).as_new_record)
  end

  it "renders new peak form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => peaks_path, :method => "post" do
      assert_select "input#peak_name", :name => "peak[name]"
      assert_select "input#peak_altitude", :name => "peak[altitude]"
    end
  end
end
