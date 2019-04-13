class RemoveNilFromStand < ActiveRecord::Migration[5.2]
  def change
    change_column :event_details, :stand, :boolean
  end
end
