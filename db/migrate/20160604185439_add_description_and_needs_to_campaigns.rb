class AddDescriptionAndNeedsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :company_description, :text, after: :title
    add_column :campaigns, :company_needs, :text, after: :company_description
    remove_column :campaigns, :sub_title, :text
  end
end
