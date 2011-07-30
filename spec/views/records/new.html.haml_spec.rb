require 'spec_helper'

describe "records/new.html.haml" do
  before(:each) do
    assign(:record, stub_model(Record,
      Fabricate.build(:record).attributes
    ).as_new_record)
  end

  it "renders new record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => records_path, :method => "post" do
      assert_select "input#record_name", :name => "record[name]"
      assert_select "input#record_content", :name => "record[content]"
    end
  end
end
