require 'spec_helper'

describe "equipments/new.html.haml" do
  before(:each) do
    assign(:equipment, stub_model(Equipment,
      :name => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new equipment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => equipments_path, :method => "post" do
      assert_select "input#equipment_name", :name => "equipment[name]"
      assert_select "textarea#equipment_content", :name => "equipment[content]"
    end
  end
end
