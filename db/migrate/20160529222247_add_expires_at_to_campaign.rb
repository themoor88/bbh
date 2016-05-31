class AddExpiresAtToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :expires_at, :datetime, after: :state
  end
end
