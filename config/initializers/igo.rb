# Igo morphological analyzer
# If you use it, you should place ipadic directory in lib directory.
# You can create ipadic directory, if you see http://igo.sourceforge.jp/index.html
module Yamadb
  module Igo
    @@ipadic = File.join(Rails.root, 'lib/ipadic')
    @@tagger = ::Igo::Tagger.new(@@ipadic) if File.exists?(@@ipadic)
    def parse(string)
      @@tagger ? @@tagger.parse(string) : []
    end

    def wakati(string)
      @@tagger ? @@tagger.wakati(string) : []
    end
    module_function :parse, :wakati
  end
end
