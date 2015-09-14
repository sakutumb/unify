=begin
  49.1ms)  DROP TABLE `unify_matchmakers_mappings`
  49.1ms)  CREATE TABLE `unify_matchmakers_mappings` (`id` int(11) auto_increment PRIMARY KEY, `matchmakers_id` int(11), `religion_id` int(11), `caste_id` int(11), `language_id` int(11)) ENGINE=InnoDB
=end
class UnifyMatchmakersMappingsRedo < ActiveRecord::Migration
  def change
    create_table "unify_matchmakers_mappings", force: true do |t|
      t.integer "matchmakers_id"
      t.integer "religion_id"
      t.integer "caste_id"
      t.integer "language_id"
    end
  end
end
