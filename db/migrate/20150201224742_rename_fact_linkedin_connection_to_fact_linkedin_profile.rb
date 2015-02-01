class RenameFactLinkedinConnectionToFactLinkedinProfile < ActiveRecord::Migration
  def change
    rename_table :fact_linkedin_connections, :fact_linkedin_profiles
  end
end
