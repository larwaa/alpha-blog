class AddStandToEventDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :event_details, :stand, :boolean
  end
end
