class AddFieldsForUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, after: :email
    add_column :users, :last_name, :string, after: :first_name
    add_column :users, :position, :string, after: :last_name
    add_column :users, :company, :string, after: :position
    add_column :users, :company_type, :string, after: :company
    add_column :users, :telephone, :string, after: :company_type
    add_column :users, :mobile, :string, after: :telephone
    add_column :users, :address, :string, after: :mobile
    add_column :users, :country, :string, after: :address
  end
end
