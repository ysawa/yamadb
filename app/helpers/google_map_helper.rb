module GoogleMapHelper
  def google_map_include_tag
    javascript_include_tag "http://maps.google.com/maps/api/js?sensor=false&language=ja"
  end
end
