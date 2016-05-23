class ChangeDataTypeForDescription < ActiveRecord::Migration
  def change
    change_column :campaigns, :description, :text
    change_column :proposed_solutions, :description, :text
  end
end
