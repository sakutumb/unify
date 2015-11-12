=begin
   (1.4ms)  SET FOREIGN_KEY_CHECKS = 0
   (49.1ms)  DROP TABLE `unify_matchmakers`
   (99.6ms)  CREATE TABLE `unify_matchmakers` (`id` int(11) auto_increment PRIMARY KEY, `user_name` varchar(128) DEFAULT '0' NOT NULL, `password` varchar(128) DEFAULT '0' NOT NULL, `company_name` varchar(128) DEFAULT '0' NOT NULL, `first_name` varchar(56) DEFAULT '0' NOT NULL, `last_name` varchar(56) DEFAULT '0' NOT NULL, `email_address` varchar(56) DEFAULT '0' NOT NULL, `phone` varchar(255) DEFAULT '0' NOT NULL, `address_1` varchar(128) DEFAULT '0' NOT NULL, `address_2` varchar(128) DEFAULT '0' NOT NULL, `state` varchar(25), `city` varchar(25), `country_id` int(11) DEFAULT 0 NOT NULL, `locale_id` int(11) DEFAULT 0 NOT NULL, `last_updated` datetime NOT NULL, `biz_location` varchar(255)) ENGINE=InnoDB
  
=end
class UnifyMatchmakersRedo < ActiveRecord::Migration
  def change
    DimReligion.connection.execute("SET FOREIGN_KEY_CHECKS = 0")
    create_table "unify_matchmakers", force: true do |t|
      t.string   "user_name",     limit: 128, default: "0", null: false
      t.string   "password",      limit: 128, default: "0", null: false
      t.string   "company_name",  limit: 128, default: "0", null: false
      t.string   "first_name",    limit: 56,  default: "0", null: false
      t.string   "last_name",     limit: 56,  default: "0", null: false
      t.string   "email_address", limit: 56,  default: "0", null: false
      t.string   "phone",                     default: "0", null: false
      t.string   "address_1",     limit: 128, default: "0", null: false
      t.string   "address_2",     limit: 128, default: "0", null: false
      t.string   "state",         limit: 25
      t.string   "city",          limit: 25
      t.integer  "country_id",                default: 0,   null: false
      t.integer  "locale_id",                 default: 0,   null: false
      t.datetime "last_updated",                            null: false
      t.string   "biz_location"
    end
  end
end
