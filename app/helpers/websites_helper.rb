module WebsitesHelper
  def google_map_url(options = {})
    latitude = options[:latitude]
    longitude = options[:longitude]
    if latitude && longitude
      "http://www.google.co.jp/maps?z=11&ll=#{latitude},#{longitude}&t=h"
    else
      'http://www.google.co.jp/maps'
    end
  end

  def link_to_source(href)
    header = t('information.source')
    name = href.gsub(/((http|https):\/\/|www\.|\/$)/, '')
    link = link_to name, href, :target => :_blank
    content_tag :span, raw("(#{header}: #{link})"), :class => :source
  end

  def twitter_url
    'http://twitter.com/'
  end

  def watchizu_url(options = {})
    if options[:latitude] && options[:longitude]
      latitude = { :sum => options[:latitude].to_f, :degree => options[:latitude].to_i }
      latitude[:minute] = ((latitude[:sum] - latitude[:degree]) * 60).to_i
      latitude[:second] = ((((latitude[:sum] - latitude[:degree]) * 60) - latitude[:minute]) * 60).to_i
      longitude = { :sum => options[:longitude].to_f, :degree => options[:longitude].to_i }
      longitude[:minute] = ((longitude[:sum] - longitude[:degree]) * 60).to_i
      longitude[:second] = ((((longitude[:sum] - longitude[:degree]) * 60) - longitude[:minute]) * 60).to_i
      "http://watchizux.gsi.go.jp/watchizu.html?b=#{latitude[:degree]}#{latitude[:minute]}#{latitude[:second]}&l=#{longitude[:degree]}#{longitude[:minute]}#{longitude[:second]}"
    else
      'http://watchizux.gsi.go.jp/watchizu.html'
    end
  end

  def wunderground_url
    'http://www.wunderground.com'
  end
end
