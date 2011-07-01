require 'spec_helper'

describe "items/new.html.haml" do
  before(:each) do
    assign(:item, stub_model(Item,
      :code => "MyString",
      :name => "MyString",
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path, :method => "post" do
      assert_select "input#item_code", :name => "item[code]"
      assert_select "input#item_name", :name => "item[name]"
      assert_select "input#item_content", :name => "item[content]"
    end
  end
end
