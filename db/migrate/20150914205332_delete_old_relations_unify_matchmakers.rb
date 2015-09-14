=begin
 (409.2ms)  ALTER TABLE unify_matchmakers DROP FOREIGN KEY FK__dim_religion
 (441.9ms)  ALTER TABLE unify_matchmakers DROP FOREIGN KEY FK_unify_matchmaker_dim_locale
 (259.4ms)  ALTER TABLE unify_matchmakers DROP FOREIGN KEY FK__dim_language
 (252.2ms)  ALTER TABLE unify_matchmakers DROP FOREIGN KEY FK__dim_caste
 (234.2ms)  ALTER TABLE `unify_matchmakers` DROP `religion_id`
 (292.3ms)  ALTER TABLE `unify_matchmakers` DROP `language_id`
 (259.6ms)  ALTER TABLE `unify_matchmakers` DROP `caste_id`  
=end

class DeleteOldRelationsUnifyMatchmakers < ActiveRecord::Migration
  #relations go for mappings
  def change
    DimReligion.connection.execute("ALTER TABLE unify_matchmakers DROP FOREIGN KEY FK__dim_religion")
    DimReligion.connection.execute("ALTER TABLE unify_matchmakers DROP FOREIGN KEY FK_unify_matchmaker_dim_locale")
    DimReligion.connection.execute("ALTER TABLE unify_matchmakers DROP FOREIGN KEY FK__dim_language")
    DimReligion.connection.execute("ALTER TABLE unify_matchmakers DROP FOREIGN KEY FK__dim_caste")
    #remove_index "FK__dim_religion"
    remove_column :unify_matchmakers, :religion_id
    remove_column :unify_matchmakers, :language_id
    remove_column :unify_matchmakers, :caste_id
  end
end
