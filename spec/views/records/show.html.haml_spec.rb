require 'spec_helper'

describe "records/show.html.haml" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      Fabricate.build(:record).attributes
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(@record.name)
  end
end
