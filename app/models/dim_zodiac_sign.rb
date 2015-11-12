# == Schema Information
#
# Table name: dim_zodiac_signs
#
#  id          :integer          not null, primary key
#  name        :string(256)      not null
#  from_date   :date             not null
#  to_date     :date             not null
#  language_id :integer          not null
#  locale_id   :integer          not null
#

class DimZodiacSign  < ActiveRecord::Base
end
