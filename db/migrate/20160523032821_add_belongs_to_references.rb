class AddBelongsToReferences < ActiveRecord::Migration
  def change
    add_reference :campaigns, :tech_seeker, index: true, foreign_key: true, after: :id
    add_reference :proposed_solutions, :tech_provider, index: true, foreign_key: true, after: :id
  end
end
