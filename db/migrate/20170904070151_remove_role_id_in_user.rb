class RemoveRoleIdInUser < ActiveRecord::Migration
  def change
  	remove_column :users, :role_id
  end
end
