class AddPercentMatchAndReviewedState < ActiveRecord::Migration
  def change
    remove_column :campaigns, :percent_match, :string, after: :meeting_requests
    remove_column :campaigns, :applications_reviewed, :integer, after: :cost
    add_column :proposed_solutions, :percent_match, :integer, after: :expectations
    add_column :proposed_solutions, :reviewed, :boolean, after: :percent_match
  end
end
