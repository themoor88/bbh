class AddMultipleAttachmentsToProposedSolution < ActiveRecord::Migration
  def change
    rename_column :proposed_solutions, :attachment_file_name, :attachment_1_file_name
    rename_column :proposed_solutions, :attachment_content_type, :attachment_1_content_type
    rename_column :proposed_solutions, :attachment_file_size, :attachment_1_file_size
    rename_column :proposed_solutions, :attachment_updated_at, :attachment_1_updated_at
    add_attachment :proposed_solutions, :attachment_2
    add_attachment :proposed_solutions, :attachment_3
  end
end
