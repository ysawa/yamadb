require 'spec_helper'

describe "records/edit.html.haml" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      Fabricate.build(:record).attributes
    ))
  end

  it "renders the edit record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => records_path(@record), :method => "post" do
      assert_select "input#record_name", :name => "record[name]"
      assert_select "textarea#record_content", :name => "record[content]"
    end
  end
end
