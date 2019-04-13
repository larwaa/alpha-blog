class AddCompanyDetailsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :company_details_id, :integer
  end
end
