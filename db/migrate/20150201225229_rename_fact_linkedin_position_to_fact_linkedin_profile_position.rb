class RenameFactLinkedinPositionToFactLinkedinProfilePosition < ActiveRecord::Migration
  def change
    rename_table :fact_linkedin_positions, :fact_linkedin_profile_positions
  end
end
