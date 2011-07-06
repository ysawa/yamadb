require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the MainHelper. For example:
#
# describe MainHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  describe "encode_unicode_entities" do
    it "encode unicode entities to human" do
      unicode = "EPI(&#x30A4;&#x30FC;&#x30D4;&#x30FC;&#x30A2;&#x30A4;) EPI&#x30A2;&#x30EB;&#x30DF;3&#x70B9;&#x98DF;&#x5668;&#x30BB;&#x30C3;&#x30C8; C-5201"
      human = "EPI(イーピーアイ) EPIアルミ3点食器セット C-5201"
      helper.encode_unicode_entities(unicode).should == human
    end
  end
end
