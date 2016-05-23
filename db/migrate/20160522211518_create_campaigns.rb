class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :description
      t.string :state
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
