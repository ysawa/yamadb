require 'spec_helper'
require 'picture_providers'

describe PictureProviders do
  describe 'Instagram' do
    before do
      @tweet = Fabricate(:tweet)
    end

    describe 'with valid text' do
      before do
        @pictures = PictureProviders::Instagram.
            search_and_convert_all('TEST http://instagr.am/p/AbcdE/ STRING', @tweet)
        @picture = @pictures.last
      end

      it 'search and convert all pictures' do
        @pictures.should_not be_blank
        @picture.should == Picture.last
        @picture.href.should include 'http://instagr.am/p/AbcdE/media'
        @picture.source.should == 'http://instagr.am/p/AbcdE/'
      end

      it 'relate album' do
        @picture.album.should == @tweet
      end
    end

    describe 'with invalid text' do
      before do
        @pictures = PictureProviders::Instagram.
            search_and_convert_all('TEST STRING')
      end

      it 'cannot search and convert all pictures' do
        @pictures.should be_blank
      end
    end
  end

  describe 'ALL' do
    it 'search and convert all pictures from valid text' do
      @pictures = PictureProviders.
          search_and_convert_all('TEST http://instagr.am/p/AbcdE/ STRING')

      @picture = @pictures.last
      @pictures.should_not be_blank
      @picture.should == Picture.last
      @picture.href.should include 'http://instagr.am/p/AbcdE/media'
      @picture.source.should == 'http://instagr.am/p/AbcdE/'
    end

    it 'cannot search and convert all pictures from invalid text' do
      @pictures = PictureProviders.
          search_and_convert_all('TEST STRING')
      @pictures.should be_blank
    end
  end
end
