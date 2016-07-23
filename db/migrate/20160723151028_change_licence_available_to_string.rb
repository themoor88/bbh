class ChangeLicenceAvailableToString < ActiveRecord::Migration
  def change
    change_column :proposed_solutions, :licence_available, :string
  end
end
