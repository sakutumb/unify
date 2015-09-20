=begin
ALTER TABLE `unify_matchmakers_mappings` DROP `matchmakerS_id_URLC`
ALTER TABLE `unify_matchmakers_mappings` DROP `country_id`
ALTER TABLE `unify_matchmakers_mappings` ADD `religion_id` int(11)
ALTER TABLE `unify_matchmakers_mappings` ADD `caste_id` int(11)
ALTER TABLE `unify_matchmakers_mappings` ADD `language_id` int(11)
=end

class RestructureUnifyMatchmakerMappings < ActiveRecord::Migration
  change_table :unify_matchmakers_mappings do |t|
	  t.remove :matchmakerS_id_URLC, :country_id
	  t.integer :religion_id
	  t.integer :caste_id
	  t.integer	:language_id
	end
end
