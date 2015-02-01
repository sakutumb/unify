class FactLinkedinProfile< ActiveRecord::Base


  validates :unify_user_id, :presence => true
  validates :linkedin_user_id, :uniqueness => true, :presence => true

  before_save :update_timestamp

  def update_timestamp
    self.last_updated = DateTime.now
  end

end