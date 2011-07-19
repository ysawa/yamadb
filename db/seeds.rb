# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
map_file = File.join(Rails.root, 'config/maps.yml')
if File.exists?(map_file)
  maps = YAML.load_file(map_file)
  unless maps.count == Map.count
    Map.destroy_all
    maps.each do |map|
      Map.create(map)
    end
  end
end
