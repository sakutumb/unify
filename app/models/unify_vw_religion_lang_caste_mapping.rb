# == Schema Information
#
# Table name: unify_vw_religion_lang_caste_mappings
#
#  religion_id   :integer          default(0), not null
#  religion_name :string(256)      not null
#  language_id   :integer          default(0), not null
#  language_name :string(256)      not null
#  caste_id      :integer          default(0), not null
#  caste_name    :string(50)       default("0"), not null
#  locale_id     :integer          default(0), not null
#  locale_name   :string(50)       not null
#

class UnifyVwReligionLangCasteMapping  < ActiveRecord::Base
  self.primary_key = :id  #Added to get rid of the Active Record error - 'nil is not a symbol'
  def readonly?
    true
  end
end
