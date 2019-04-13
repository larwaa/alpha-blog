class RemoveEventDetails < ActiveRecord::Migration[5.2]
  def change
    drop_table :event_details
  end
end
