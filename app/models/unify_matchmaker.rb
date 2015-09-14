 class UnifyMatchmaker  < ActiveRecord::Base
  validates :company_name, presence: true, length: {maximum: 128}
  validates :phone_number, presence: true, numericality: { only_integer: true , greater_than:0}
  validates :address_1, presence: true, length: {maximum: 128}
  validates :address_2, length: {maximum: 128}
  validates :city, presence: true, length: {maximum: 25}
  validates :state, presence: true, length: {maximum: 25}
  validates :country_id, presence: true, numericality: { only_integer: true , greater_than:0}

  has_many :unify_matchmaker_mappings
end
