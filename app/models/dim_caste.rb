# == Schema Information
#
# Table name: dim_castes
#
#  id        :integer          not null, primary key
#  name      :string(50)       default("0"), not null
#  locale_id :integer          not null
#

class DimCaste  < ActiveRecord::Base
  has_many :unify_matchmakers_mappings, foreign_key: "caste_id"  

end
