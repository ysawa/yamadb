require 'picture_providers/instagram'

module PictureProviders
  ALL = [Instagram]
  def search_and_convert_all(text, album = nil)
    pictures = []
    ALL.each do |provider|
      pictures += provider.search_and_convert_all(text, album)
    end
    pictures
  end

  module_function :search_and_convert_all
end
