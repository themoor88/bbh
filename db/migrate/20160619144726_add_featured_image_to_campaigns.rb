class AddFeaturedImageToCampaigns < ActiveRecord::Migration
  def up
    add_attachment :campaigns, :featured_image, after: :title
  end

  def down
    remove_attachment :campaigns, :featured_image
  end
end
