class CreateProposedSolutions < ActiveRecord::Migration
  def change
    create_table :proposed_solutions do |t|
      t.string :name
      t.string :description
      t.string :state

      t.timestamps null: false
    end
  end
end
