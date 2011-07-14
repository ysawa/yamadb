require 'wunderground'
class WeatherForecast
  include Mongoid::Document
  include Mongoid::Timestamps
  field :at, :type => Time
  field :condition, :type => String
  field :high, :type => Integer
  field :latitude, :type => Float
  field :longitude, :type => Float
  field :low, :type => Integer

  class << self
    def find_latest_of_this_week(latitude, longitude)
      criteria.where(:latitude => latitude, :longitude => longitude, :created_at.gt => Time.now - 3.hours)
    end

    def find_this_week(latitude, longitude)
      if (forecasts = find_latest_of_this_week(latitude, longitude)).present?
        return forecasts
      end
      forecasts = Wunderground.get_weather_forecasts(latitude, longitude)
      result = []
      forecasts.each do |forecast|
        result << create(forecast)
      end
      result
    end

    def icon_url(condition)
      Wunderground.icon_url(condition)
    end
  end
end
