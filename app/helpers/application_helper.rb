module ApplicationHelper
  def encode_unicode_entities(unicode)
    unicode.gsub(/\&#x(\w+);/) { [$1.hex].pack('U') }
  end
end
