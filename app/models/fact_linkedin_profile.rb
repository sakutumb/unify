# == Schema Information
#
# Table name: fact_linkedin_profiles
#
#  seq_num               :integer          not null, primary key
#  unify_user_id         :string(200)      not null
#  linkedin_user_id      :string(200)      not null
#  first_name            :string(100)
#  last_name             :string(100)
#  headline              :string(2000)
#  location              :string(200)
#  location_country_code :string(3)
#  industry              :string(200)
#  distance              :integer
#  picture_url           :string(2000)
#  public_profile_url    :string(2000)
#  last_updated          :datetime
#

class FactLinkedinProfile< ActiveRecord::Base


  validates :unify_user_id, :presence => true
  validates :linkedin_user_id, :uniqueness => true, :presence => true

  before_save :update_timestamp

  def update_timestamp
    self.last_updated = DateTime.now
  end

end
