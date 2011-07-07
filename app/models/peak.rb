class Peak
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :location, :type => Array
  field :altitude, :type => Integer
  index [[:location, Mongo::GEO2D]], :min => -180, :max => 180
  GOOGLE_MAPS_API = "http://maps.google.com/maps/api/geocode/json"
  validates_with PeakValidator

  def latitude
    self.location ? self.location[0] : nil
  end

  def longitude
    self.location ? self.location[1] : nil
  end

  def get_location(peak_name = nil)
    peak_name ||= self.name
    return nil if peak_name.blank?
    href = GOOGLE_MAPS_API + "?address=" + peak_name + "&sensor=false&language=ja"
    response = Net::HTTP.get_response(URI.parse(URI.encode(href)))
    return nil unless response.kind_of? Net::HTTPSuccess
    json = ActiveSupport::JSON.decode(response.body)
    return nil unless json["status"] == "OK"
    result = json["results"].first
    if self.name.blank?
      components = result["address_components"].first
      self.name = components["short_name"]
    end
    location_hash = result["geometry"]["location"]
    self.location = [location_hash["lat"], location_hash["lng"]]
    return true
  end
end
