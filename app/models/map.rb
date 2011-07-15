class Map
  include Mongoid::Document
  include Mongoid::Timestamps
  # Latitudes and longitudes of Map are described with the seconds format.
  field :east, :type => Integer
  field :name, :type => String
  field :north, :type => Integer
  field :south, :type => Integer
  field :west, :type => Integer
  has_many :peaks

  class << self
    def degree_to_second(degree)
      hour = degree.to_i
      minute = ((degree - hour) * 60).to_i
      second = (((degree - hour) * 60 - minute) * 60).to_i
      hour * 3600 + minute * 60 + second
    end

    def find_by_degrees(latitude, longitude)
      latitude_second = degree_to_second(latitude)
      longitude_second = degree_to_second(longitude)
      where(
        :north.gte => latitude_second,
        :south.lt => latitude_second,
        :east.gte => longitude_second,
        :west.lt => longitude_second
      ).first
    end
  end
end
