class AddInterestsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :interests, :string, after: :last_name
  end
end
