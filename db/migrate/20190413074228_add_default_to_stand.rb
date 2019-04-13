class AddDefaultToStand < ActiveRecord::Migration[5.2]
  def change
    change_column :event_details, :stand, :boolean, default: false;
  end
end
