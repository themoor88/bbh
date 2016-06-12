class RemoveCompanyTypeFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :company_type, :string
  end
end
