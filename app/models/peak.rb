class Peak
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :location, :type => Array
  field :altitude, :type => Integer
  index [[:location, Mongo::GEO2D]], :min => -180, :max => 180
  GOOGLE_MAPS_API = "http://maps.google.com/maps/api/geocode/json"

  def get_location
    return nil if self.name.blank?
    href = GOOGLE_MAPS_API + "?address=" + self.name + "&sensor=false"
    response = Net::HTTP.get_response(URI.parse(URI.encode(href)))
    return nil unless response.kind_of? Net::HTTPSuccess
    json = ActiveSupport::JSON.decode(response.body)
    return nil unless json["status"] == "OK"
    result = json["results"].first
    location_hash = result["geometry"]["location"]
    self.location = [location_hash["lng"], location_hash["lat"]]
    return true
  end
end
