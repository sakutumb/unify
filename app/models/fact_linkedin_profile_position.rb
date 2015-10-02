# == Schema Information
#
# Table name: fact_linkedin_profile_positions
#
#  seq_num              :integer          not null, primary key
#  linkedin_user_id     :string(200)      not null
#  linkedin_position_id :integer
#  title                :string(200)
#  company_id           :integer
#  company_name         :string(200)
#  start_date           :datetime
#  end_date             :datetime
#  is_current           :string(10)
#  last_updated         :datetime
#

class FactLinkedinProfilePosition < ActiveRecord::Base

  validates :linkedin_user_id, :presence => true
  validates :linkedin_position_id, :uniqueness => true, :presence => true

  before_save :update_timestamp

  def update_timestamp
    self.last_updated = DateTime.now
  end

end
