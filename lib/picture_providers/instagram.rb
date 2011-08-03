module PictureProviders
  class Instagram
    REGEXP = %r|(http:\/\/instagr\.am\/p\/[\w\-]+\/?)|
    class << self
      def convert(source_href, album = nil)
        picture = ::Picture.find_or_initialize_by(:source => source_href)
        picture.album = album
        picture.href = source_href.sub(/(\/|)$/, '/media/?size=t')
        picture.save
        picture
      end

      def search(text)
        REGEXP.match(text).to_a.uniq
      end

      def search_and_convert_all(text, album = nil)
        pictures = []
        search(text).each do |source_href|
          pictures << convert(source_href, album)
        end
        pictures
      end
    end
  end
end
