class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, after: :id
  end
end
