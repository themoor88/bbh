class AddAttachmentToProposedSolutions < ActiveRecord::Migration
  def self.up
    add_attachment :proposed_solutions, :attachment
  end

  def self.down
    remove_attachment :proposed_solutions, :attachment
  end
end
