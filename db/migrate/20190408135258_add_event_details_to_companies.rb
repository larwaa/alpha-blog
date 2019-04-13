class AddEventDetailsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :event_details_id, :integer
  end
end
