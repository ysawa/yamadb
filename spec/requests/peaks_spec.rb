require 'spec_helper'

describe "Peaks" do
  describe "GET /peaks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get peaks_path
      response.status.should be(200)
    end
  end
end
