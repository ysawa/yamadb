module GoogleMapHelper
  def google_map_include_tag
    javascript_include_tag "http://maps.google.com/maps/api/js?sensor=false&language=ja"
  end

  def google_map_peak_image(location, options = {})
    options.stringify_keys!
    if location.present? && location.size == 2
      protocol = (options['secure'] ? 'https' : 'http')
      image_tag "#{protocol}://maps.google.com/maps/api/staticmap?center=#{location[0]},#{location[1]}&zoom=10&size=160x160&sensor=false"
    else
      image_tag '/images/common/no_picture.png'
    end
  end
end
