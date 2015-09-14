class UnifyMatchmakersMapping  < ActiveRecord::Base
  validates :matchmakers_id, presence: true, numericality: { only_integer: true, greater_than:0}
  validates :religion_id, numericality: { only_integer: true, greater_than:0}
  validates :caste_id, numericality: { only_integer: true, greater_than:0}
  validates :language_id, numericality: { only_integer: true, greater_than:0}

  belongs_to :unify_matchmaker, foreign_key: "matchmakers_id"
  belongs_to :dim_religion, foreign_key: "religion_id"
  belongs_to :dim_caste, foreign_key: "caste_id"
  belongs_to :dim_language, foreign_key: "language_id"
end
