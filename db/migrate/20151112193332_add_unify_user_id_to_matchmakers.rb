class AddUnifyUserIdToMatchmakers < ActiveRecord::Migration
  def change
    add_column :unify_matchmakers, :unify_user_id, :string
  end
end
