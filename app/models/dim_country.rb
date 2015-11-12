# == Schema Information
#
# Table name: dim_countries
#
#  id                  :integer          not null, primary key
#  name                :string(256)      not null
#  locale_id           :integer          not null
#  country_new_code    :integer
#  country_old_code    :integer
#  country_abbrevation :string(10)
#

class DimCountry  < ActiveRecord::Base
  has_many :unify_matchmakers, foreign_key: 'country_id'
end
