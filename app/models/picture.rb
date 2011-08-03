class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  field :height, :type => Integer
  field :group, :type => String
  field :href, :type => String
  field :source, :type => String
  field :width, :type => Integer
  index :href
  index :source
  belongs_to :album, :polymorphic => true

  def Picture.new_from_amazon_xml(xml)
    picture = Picture.new
    picture.href = (xml/'URL').inner_text
    picture.height = (xml/'Height').inner_text
    picture.width = (xml/'Width').inner_text
    picture
  end

  def Picture.pictures_from_amazon_xml(xml)
    pictures = []
    nokogiri = Nokogiri::XML(xml)
    (nokogiri/'ImageSet').children.each do |element|
      next if element.children.blank?
      picture = Picture.new_from_amazon_xml(element.children)
      picture.group = element.name
      pictures << picture
    end
    pictures
  end
end
