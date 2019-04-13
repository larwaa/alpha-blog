class AddDetailsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :company_id, :integer
    add_column :events, :description, :text
    add_column :events, :title, :string
    add_column :events, :stand, :boolean, default: false
    add_column :events, :representatives, :integer
    add_column :events, :food, :string
    add_column :events, :attendees, :integer
    add_column :events, :type, :string
  end
end
