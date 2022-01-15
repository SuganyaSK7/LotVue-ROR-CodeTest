class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :is_checked, default: true
      t.timestamps
    end
  end
end
