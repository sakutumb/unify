class UnifyMatchmakersMapping  < ActiveRecord::Base
  validates :matchmaker_id, presence: true, numericality: { only_integer: true, greater_than:0}
  validates :matchmaker_id_URLC, presence: true, numericality: { only_integer: true, greater_than:0}
  validates :country_id, presence: true, numericality: { only_integer: true, greater_than:0}

  belongs_to :unify_matchmaker, foreign_key: "matchmaker_id"
  belongs_to :unify_religion_lang_caste_mapping, foreign_key: "matchmaker_id_URLC"
end
