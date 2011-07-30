require 'spec_helper'

describe "records/show.html.haml" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      :name => "Name",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
  end
end
