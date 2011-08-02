module ApplicationHelper
  def encode_unicode_entities(unicode)
    Product.encode_unicode_entities(unicode)
  end

  def error_explanation(model)
    if model.errors.any?
      errors = ''.html_safe
      model.errors.full_messages.each do |msg|
        errors += content_tag(:li, msg)
      end
      errors = content_tag(:ul, errors)
      if model.errors.count > 1
        errors = content_tag(:h2, t('activemodel.errors.template.header.other', :count => model.errors.count)) + errors
      else
        errors = content_tag(:h2, t('activemodel.errors.template.header.one')) + errors
      end
      content_tag :div, errors, :id => :error_explanation
    else
      nil
    end
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
