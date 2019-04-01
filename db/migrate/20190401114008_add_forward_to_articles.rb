class AddForwardToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :forward, :boolean
  end
end
