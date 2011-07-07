require 'spec_helper'

describe "products/edit.html.haml" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :code => "MyString",
      :name => "MyString",
      :content => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_code", :name => "product[code]"
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_content", :name => "product[content]"
    end
  end
end
