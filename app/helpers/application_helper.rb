module ApplicationHelper
  def encode_unicode_entities(unicode)
    Product.encode_unicode_entities(unicode)
  end

  def htmlify(content, options = {})
    return "" if content.blank?
    html = content
    lines = html.split(/(\r\n|\r|\n)/)
    lines.delete_if { |line| line =~ /(\r\n|\r|\n)/ }
    html = lines.join('<br />')
    uris = []
    URI.extract(html, %w(http https)).each do |uri|
      next if uris.include?(uri)
      html.gsub!(uri, link_to(truncate(uri, :length => 40), uri, :class => :truncate))
      uris << uri
    end
    raw html
  end
end
