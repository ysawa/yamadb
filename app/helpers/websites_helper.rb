module WebsitesHelper
  def google_map_url(options = {})
    latitude = options[:latitude]
    longitude = options[:longitude]
    if latitude && longitude
      "http://www.google.co.jp/maps?z=11&ll=#{latitude},#{longitude}&t=h"
    else
      "http://www.google.co.jp/"
    end
  end

  def watchizu_url(options = {})
    latitude = options[:latitude]
    longitude = options[:longitude]
    if latitude && longitude
      "http://watchizu.gsi.go.jp/watchizu.html?longitude=#{longitude}&latitude=#{latitude}"
    else
      "http://watchizu.gsi.go.jp/"
    end
  end
end
