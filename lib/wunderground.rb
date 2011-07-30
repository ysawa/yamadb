module Wunderground
  class AccessError < StandardError; end
  FORECAST_XML = 'http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml'
  def get_weather_forecasts(latitude, longitude)
    response = Net::HTTP.get_response URI.parse(Wunderground::FORECAST_XML + '?query=' + "#{latitude},#{longitude}")
    unless response.kind_of? Net::HTTPSuccess
      raise AccessError, "HTTP Response: #{response.code} #{response.message}"
    end
    parse_weather_forecasts_xml(response.body, :latitude => latitude, :longitude => longitude)
  end

  def icon_url(condition)
    "http://icons-ecast.wxug.com/i/c/k/#{condition}.gif"
  end

  def parse_weather_forecasts_xml(xml, options = {})
    nokogiri = Nokogiri::XML(xml)
    forecasts = []
    ((nokogiri/'forecast/simpleforecast').children/'forecastday').each do |forecastday|
      forecast = options.dup
      forecast[:at] = Time.parse((forecastday/'pretty').first.inner_text)
      forecast[:condition] = (forecastday/'icon').first.inner_text
      forecast[:high] = (forecastday/'high/celsius').first.inner_text
      forecast[:low] = (forecastday/'low/celsius').first.inner_text
      forecasts << forecast
    end
    forecasts
  end

  def weather_forecasts_url
  end

  module_function :get_weather_forecasts, :icon_url, :parse_weather_forecasts_xml
end
