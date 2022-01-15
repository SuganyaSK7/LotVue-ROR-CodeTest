class ChangeRoleColumn < ActiveRecord::Migration
  def change
  	rename_column :roles, :is_checked, :is_hidden
  end
end
