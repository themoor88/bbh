class AddChallengesToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :company_challenges, :text, after: :company_needs
  end
end
