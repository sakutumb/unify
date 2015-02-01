class AddLinkedinPositionIdToFactLinkedinPosition < ActiveRecord::Migration
  def change
    add_column :fact_linkedin_positions, :linkedin_position_id, :integer
  end
end
