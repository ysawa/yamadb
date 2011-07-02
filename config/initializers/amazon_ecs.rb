require 'amazon/ecs'

config_path = File.join(Rails.root, 'config/amazon_ecs.yml')
config = HashWithIndifferentAccess.new YAML.load_file(config_path)

Amazon::Ecs.options = config

Amazon::Ecs.debug = true if Rails.env.development?

module Amazon
  class Ecs
    def self.item_search_with_images(query, options = {})
      self.item_search(query, options.reverse_merge(:response_group => "Images,ItemAttributes"))
    end
  end
end
