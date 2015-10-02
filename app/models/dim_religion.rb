# == Schema Information
#
# Table name: dim_religions
#
#  id        :integer          not null, primary key
#  name      :string(256)      not null
#  locale_id :integer          not null
#

class DimReligion  < ActiveRecord::Base
  has_many :unify_matchmakers_mappings, foreign_key: "religion_id"  

end
