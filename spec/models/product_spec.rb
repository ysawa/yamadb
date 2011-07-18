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

  describe 'Product.books' do
    it 'cannot get sporting goods' do
      sporting_good = Fabricate(:product)
      books = Product.books
      books.should_not include sporting_good
    end
  end

  describe 'Product.sporting_goods' do
    it 'can get sporting goods' do
      sporting_good = Fabricate(:product)
      sporting_goods = Product.sporting_goods
      sporting_goods.should include sporting_good
    end
  end
end
