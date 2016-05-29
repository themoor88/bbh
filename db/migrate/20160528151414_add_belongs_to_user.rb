class AddBelongsToUser < ActiveRecord::Migration
  def change
    add_reference :campaigns, :user, index: true, after: :id
    add_reference :proposed_solutions, :user, index: true, after: :id
    add_reference :proposed_solutions, :campaign, index: true, after: :user_id
  end
end
