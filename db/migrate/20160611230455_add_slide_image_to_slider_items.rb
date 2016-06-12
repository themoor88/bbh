class AddSlideImageToSliderItems < ActiveRecord::Migration
  def self.up
    add_attachment :slider_items, :slide_image
  end

  def self.down
    remove_attachment :slider_items, :slide_image
  end
end
