class ChangeCompanyDetailsToEventDetails < ActiveRecord::Migration[5.2]
  def change
    rename_table :company_details, :event_details
  end
end
