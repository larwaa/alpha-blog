class RemoveDetailsFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :user_id, :integer
    remove_column :companies, :event_details_id, :integer
  end
end
