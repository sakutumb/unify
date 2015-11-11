# == Schema Information
#
# Table name: unify_matchmakers
#
#  id            :integer          not null, primary key
#  user_name     :string(128)      default("0"), not null
#  password      :string(128)      default("0"), not null
#  company_name  :string(128)      default("0"), not null
#  first_name    :string(56)       default("0"), not null
#  last_name     :string(56)       default("0"), not null
#  email_address :string(56)       default("0"), not null
#  phone         :integer          default(0), not null
#  address_1     :string(128)      default("0"), not null
#  address_2     :string(128)      default("0"), not null
#  state         :string(25)
#  city          :string(25)
#  country_id    :integer          default(0), not null
#  religion_id   :integer          default(0), not null
#  language_id   :integer          default(0), not null
#  caste_id      :integer          default(0), not null
#  locale_id     :integer          default(0), not null
#  last_updated  :datetime         not null
#

 class UnifyMatchmaker  < ActiveRecord::Base
  validates :company_name, presence: true, length: {maximum: 128}
  validates :phone, presence: true, numericality: { only_integer: true}
  validates :address_1, presence: true, length: {maximum: 128}
  validates :address_2, length: {maximum: 128}
  validates :city, presence: true, length: {maximum: 25}
  validates :state, presence: true, length: {maximum: 25}
  validates :country_id, presence: true, numericality: { only_integer: true , greater_than:0}

  has_many :unify_matchmakers_mappings, foreign_key: "matchmakers_id"
  belongs_to :dim_country, foreign_key: 'country_id'

  before_save :set_last_updated

  #Set country based on abbrevation
  def country=(value)
    self.dim_country=DimCountry.find_by_country_abbrevation(value)
  end
  
  def set_last_updated
    self.last_updated=DateTime.current
  end
end
