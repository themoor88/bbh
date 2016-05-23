class AddCampaignReferenceForProposedSolution < ActiveRecord::Migration
  def change
    add_reference :proposed_solutions, :campaign, index: true, foreign_key: true, after: :tech_provider_id
  end
end
