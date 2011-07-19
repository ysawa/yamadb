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
    before do
      @book = Fabricate(:book)
      @sporting_good = Fabricate(:sporting_good)
    end

    it 'gives sporting goods, not sporting goods' do
      books = Product.books
      books.should include @book
      books.should_not include @sporting_good
    end
  end

  describe 'Product.sporting_goods' do
    before do
      @book = Fabricate(:book)
      @sporting_good = Fabricate(:sporting_good)
    end

    it 'gives sporting goods, not books' do
      sporting_goods = Product.sporting_goods
      sporting_goods.should include @sporting_good
      sporting_goods.should_not include @book
    end
  end
end
