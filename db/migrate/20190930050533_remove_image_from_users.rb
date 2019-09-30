class RemoveImageFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_image, :text
  end
end
