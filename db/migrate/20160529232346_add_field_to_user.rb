class AddFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :company_website, :string, after: :number_of_employees
  end
end
