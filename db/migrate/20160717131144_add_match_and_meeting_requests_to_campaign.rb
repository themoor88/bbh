class AddMatchAndMeetingRequestsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :meeting_requests, :integer, after: :applications_reviewed
    add_column :campaigns, :percent_match, :string, after: :meeting_requests
  end
end
