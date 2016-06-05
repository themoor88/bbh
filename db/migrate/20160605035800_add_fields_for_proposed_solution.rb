class AddFieldsForProposedSolution < ActiveRecord::Migration
  def change
    add_column :proposed_solutions, :link, :string, after: :campaign_id
    add_column :proposed_solutions, :attachment, :string, after: :link
    add_column :proposed_solutions, :technology_description, :text, after: :attachment
    add_column :proposed_solutions, :technology_application, :text, after: :technology_description
    add_column :proposed_solutions, :patents, :text, after: :technology_application
    add_column :proposed_solutions, :trl, :string, after: :patents
    add_column :proposed_solutions, :licence_available, :boolean, after: :trl
    add_column :proposed_solutions, :institution, :string, after: :licence_available
    add_column :proposed_solutions, :expectations, :text, after: :institution
    remove_column :proposed_solutions, :name, :string
    remove_column :proposed_solutions, :description, :string
    remove_column :proposed_solutions, :state, :string
  end
end
