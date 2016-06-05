class AddReferencesForLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :user, index: true, after: :id
    add_reference :likes, :campaign, index: true, after: :user_id
  end
end
