class AddImageProcessingToBackground < ActiveRecord::Migration
  def change
    add_column :backgrounds, :image_processing, :boolean
  end
end
