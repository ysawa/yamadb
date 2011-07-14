class WeatherForecast
  include Mongoid::Document
  include Mongoid::Timestamps
  field :at, :type => Time
  field :condition, :type => String
  field :high, :type => Integer
  field :latitude, :type => Float
  field :longitude, :type => Float
  field :low, :type => Integer
  WUNDERGROUND_FORECAST_XML = 'http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml'

  class << self
    def find_latest_of_this_week(latitude, longitude)
      criteria.where(:latitude => latitude, :longitude => longitude, :created_at.gt => Time.now - 3.hours)
    end

    def find_this_week(latitude, longitude)
      find_this_week_from_wunderground(latitude, longitude)
    end

    def find_this_week_from_wunderground(latitude, longitude)
      if (forecasts = find_latest_of_this_week(latitude, longitude)).present?
        return forecasts
      end
      response = Net::HTTP.get_response URI.parse(WUNDERGROUND_FORECAST_XML + '?query=' + "#{latitude},#{longitude}")
      unless response.kind_of? Net::HTTPSuccess
        raise "HTTP Response: #{response.code} #{response.message}"
      end
      nokogiri = Nokogiri::XML(response.body)
      forecasts = []
      ((nokogiri/'forecast/simpleforecast').children/'forecastday').each do |forecastday|
        forecast = new(:latitude => latitude, :longitude => longitude)
        forecast.at = Time.parse((forecastday/'pretty').first.inner_text)
        forecast.condition = (forecastday/'icon').first.inner_text
        forecast.high = (forecastday/'high/celsius').first.inner_text
        forecast.low = (forecastday/'low/celsius').first.inner_text
        forecast.save
        forecasts << forecast
      end
      forecasts
    end

    def icon_url(condition)
      icon_url_from_wunderground(condition)
    end

    def icon_url_from_wunderground(condition)
      "http://icons-ecast.wxug.com/i/c/g/#{condition}.gif"
    end
  end
end
