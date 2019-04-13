class RemoveOwnerIdFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :owner_id, :integer
  end
end
