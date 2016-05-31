class AddNumberOfEmployeesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number_of_employees, :string, after: :country
  end
end
