# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Sample data
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if DimCountry.count==0 
  [['US', 'United States',10],['CO','Colombia',57]].each do |ab, name,id|
    DimCountry.create(name: name, country_abbrevation: ab, id: id, locale_id: 1)
  end
end
%w{en es}.each do |l|
  DimLanguage.create(name:l, locale_id: 1)
end
["afrikanas","albanian"].each do |c|
  DimCaste.create(name: c, locale_id: 1)
end

%w{Hinduism Islam Christianity}.each do |r|
  DimReligion.create(name: r, locale_id: 1)
end