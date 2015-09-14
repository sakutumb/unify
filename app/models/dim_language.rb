# == Schema Information
#
# Table name: dim_languages
#
#  id        :integer          not null, primary key
#  name      :string(256)      not null
#  locale_id :integer          not null
#

class DimLanguage  < ActiveRecord::Base
  has_many :unify_matchmakers_mappings, foreign_key: "language_id"  
end
