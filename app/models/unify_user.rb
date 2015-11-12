# == Schema Information
#
# Table name: unify_users
#
#  user_id           :string(45)       not null, primary key
#  email             :string(100)      not null
#  password          :string(45)
#  password_digest   :string(300)
#  first_name        :string(100)      not null
#  last_name         :string(100)
#  user_type         :string(2)        not null
#  locale_id         :integer          not null
#  organization_name :string(100)
#  logo_image_name   :string(100)
#  last_updated      :datetime
#

class UnifyUser < ActiveRecord::Base
  has_secure_password
  has_one :unify_matchmaker

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :user_id, :presence => true, :uniqueness => true, :length => { :in => 3..100 }
  validates :email, :uniqueness => true, :format => EMAIL_REGEX
  validates_length_of :password, :in => 6..20, :on => :create
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :user_type, :presence => true
  validates :locale_id, :presence => true

  before_save :update_timestamp
  after_save :clear_password

  def update_timestamp
    self.last_updated = DateTime.now
  end

  def clear_password
    self.password = nil
  end

end
