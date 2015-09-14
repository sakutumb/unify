# == Schema Information
#
# Table name: dim_cities
#
#  id        :integer          not null, primary key
#  name      :string(128)      not null
#  locale_id :integer          not null
#

class DimCity  < ActiveRecord::Base
end
