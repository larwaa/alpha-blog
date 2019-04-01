class RemoveForwardFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :forward, :boolean
  end
end
