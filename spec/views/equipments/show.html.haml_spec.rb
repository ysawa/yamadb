require 'spec_helper'

describe "equipments/show.html.haml" do
  before(:each) do
    @equipment = assign(:equipment, stub_model(Equipment,
      :name => "Name",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
