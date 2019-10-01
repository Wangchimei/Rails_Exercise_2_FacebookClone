class RemoveTitleFromFeeds < ActiveRecord::Migration[5.2]
  def change
    remove_column :feeds, :title, :string
  end
end
