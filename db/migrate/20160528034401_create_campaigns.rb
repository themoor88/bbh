class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :sector
      t.string :country
      t.string :targeted_time_to_market
      t.string :expected_trl
      t.string :state

      t.timestamps null: false
    end
  end
end
