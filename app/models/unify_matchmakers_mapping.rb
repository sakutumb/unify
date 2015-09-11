class UnifyMatchmakersMapping  < ActiveRecord::Base
  validates :country_id, presence: true, numericality: { only_integer: true, greater_than:0}
  validates :religion_id, presence: true, numericality: { only_integer: true, greater_than:0}
  validates :language_id, presence: true, numericality: { only_integer: true, greater_than:0}

end