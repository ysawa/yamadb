require 'spec_helper'

describe "products/index.html.haml" do
  before(:each) do
    @product = Fabricate(:product)
    assign(:products, Product.all.page(1))
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => @product.name.to_s, :count => 1
  end
end
