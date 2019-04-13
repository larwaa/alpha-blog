class RemoveStandFromEventDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :event_details, :stand?, :boolean
  end
end
