class AddMoreFieldsForUser < ActiveRecord::Migration
  def change
    add_column :users, :zip_code, :string, after: :address
    add_column :users, :city, :string, after: :zip_code
  end
end
