class AddActiveToSliderItems < ActiveRecord::Migration
  def change
    add_column :slider_items, :active, :boolean, after: :link
  end
end
