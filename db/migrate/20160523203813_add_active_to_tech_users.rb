class AddActiveToTechUsers < ActiveRecord::Migration
  def change
    add_column :tech_providers, :active, :boolean, default: false, after: :email
    add_column :tech_seekers, :active, :boolean, default: false, after: :email
  end
end
