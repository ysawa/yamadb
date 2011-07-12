require 'spec_helper'
include AmazonEcsHelper

describe Product do
  describe 'Product.new_from_amazon_element' do
    it 'can give correct product' do
      element = Amazon::Element.new(amazon_item_xml)
      product = Product.new_from_amazon_element(element)
      product.name.should == 'EPI(イーピーアイ) EPIアルミ3点食器セット C-5201'
      product.group.should == 'Sports'
      product.publisher.should == 'EPI(イーピーアイ)'
      product.manufacturer == 'EPI(イーピーアイ)'
      product.pictures.should_not be_blank
    end
  end
end
