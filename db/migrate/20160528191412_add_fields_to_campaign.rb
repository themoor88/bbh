class AddFieldsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :title, :string, after: :user_id
    add_column :campaigns, :sub_title, :text, after: :title
  end
end
