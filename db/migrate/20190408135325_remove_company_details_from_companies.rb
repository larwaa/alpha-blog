class RemoveCompanyDetailsFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :company_details_id, :integer
  end
end
