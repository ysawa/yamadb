# Igo morphological analyzer
# If you use it, you should place ipadic directory in lib directory.
# You can create ipadic directory, if you see http://igo.sourceforge.jp/index.html
module Yamadb
  module Igo
    class InvalidArgument < StandardError; end

    IGNORE = []

    @@ipadic = File.join(Rails.root, 'lib/ipadic')
    @@tagger = ::Igo::Tagger.new(@@ipadic) if File.exists?(@@ipadic)

    def keywords(*strings)
      result = []
      strings.each do |string|
        next if string.blank?
        case string
        when Array
          text = string.join(' ')
        when String
          text = string
        else
          raise InvalidArgument, string
        end
        parse(text).each do |tag|
          next unless tag.feature =~ /(名詞|形容詞|形容動詞|[^助]動詞)/
          next if IGNORE.include?(tag.surface)
          next if tag.surface =~ /^[[:punct:]]+$/
          result << tag.surface
        end
      end
      result.uniq
    end
    def parse(string)
      @@tagger ? @@tagger.parse(string) : []
    end

    def wakati(string)
      @@tagger ? @@tagger.wakati(string) : []
    end
    module_function :keywords, :parse, :wakati
  end
end
