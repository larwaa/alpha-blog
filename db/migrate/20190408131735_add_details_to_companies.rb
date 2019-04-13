class AddDetailsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :name, :string
    add_column :companies, :description, :text
    add_column :companies, :owner_id, :integer
  end
end
