class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  field :height, :type => Integer
  field :group, :type => String
  field :href, :type => String
  field :width, :type => Integer
  belongs_to :album, :polymorphic => true

  def Picture.new_from_amazon_xml(xml)
    picture = Picture.new
    nokogiri = Nokogiri::XML(xml)
    picture.href = (Nokogiri::XML(xml)/'URL').inner_text
    picture.height = (Nokogiri::XML(xml)/'Height').inner_text
    picture.width = (Nokogiri::XML(xml)/'Width').inner_text
    picture
  end

  def Picture.pictures_from_amazon_xml(xml)
    pictures = []
    nokogiri = Nokogiri::XML(xml)
    (nokogiri/'ImageSet').children.each do |element|
      picture = Picture.new_from_amazon_xml(element.inner_html)
      picture.group = element.name
      pictures << picture
    end
    pictures
  end
end
