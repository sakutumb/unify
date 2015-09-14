=begin
   (305.6ms)  ALTER TABLE `unify_matchmakers` CHANGE `phone` `phone` varchar(255) DEFAULT 0 NOT NULL
   (267.0ms)  ALTER TABLE `unify_matchmakers` ADD `biz_location` varchar(255)
=end
class AddBizLocationAndChangePhoneDataTypeInUnifyMatchmakers < ActiveRecord::Migration
  def change
    change_column :unify_matchmakers, :phone, :string
    add_column :unify_matchmakers, :biz_location, :string
  end
end
