class RemoveAttachmentFromProposedSolutions < ActiveRecord::Migration
  def change
    remove_column :proposed_solutions, :attachment, :string, after: :lint
  end
end
