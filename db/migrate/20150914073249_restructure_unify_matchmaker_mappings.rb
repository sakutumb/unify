class RestructureUnifyMatchmakerMappings < ActiveRecord::Migration
  change_table :unify_matchmaker_mappings do |t|
	  t.remove :matchmakerS_id_URLC, :country_id
	  t.integer :religion_id
	  t.integer :caste_id
	  t.integer	:language_id
	end
end
