class UnifyVwReligionLangCasteMapping  < ActiveRecord::Base
  self.primary_key = :id  #Added to get rid of the Active Record error - 'nil is not a symbol'
  def readonly?
    true
  end
end