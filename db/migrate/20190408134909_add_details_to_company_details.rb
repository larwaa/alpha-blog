class AddDetailsToCompanyDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :company_details, :event_type, :string
    add_column :company_details, :food, :string
    add_column :company_details, :description, :text
    add_column :company_details, :stand, :boolean
    add_column :company_details, :representatives, :integer
  end
end
