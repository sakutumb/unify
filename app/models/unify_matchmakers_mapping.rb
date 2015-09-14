# == Schema Information
#
# Table name: unify_matchmakers_mappings
#
#  id             :integer          default(0), not null, primary key
#  matchmakers_id :integer
#  religion_id    :integer
#  caste_id       :integer
#  language_id    :integer
#

class UnifyMatchmakersMapping  < ActiveRecord::Base

  belongs_to :unify_matchmaker, foreign_key: "matchmakers_id"
  belongs_to :dim_religion, foreign_key: "religion_id"
  belongs_to :dim_caste, foreign_key: "caste_id"
  belongs_to :dim_language, foreign_key: "language_id"

  

  #Set religion from name
  def religion=(value)
    self.dim_religion=DimReligion.find_by_name(value)
  end

  #Set caste from name
  def caste=(value)
    self.dim_caste=DimCaste.find_by_name(value)
  end

  #Set language from name
  def language=(value)
    self.dim_language=DimLanguage.find_by_name(value)
  end
end
