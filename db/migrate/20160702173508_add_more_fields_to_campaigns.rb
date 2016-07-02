class AddMoreFieldsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :cost, :string, after: :state
    add_column :campaigns, :applications_reviewed, :integer, after: :cost
    add_column :campaigns, :next_meeting, :datetime, after: :applications_reviewed
  end
end
