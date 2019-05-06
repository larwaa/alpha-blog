class AddAdminOverrideToTextQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :text_questions, :admin_override, :boolean
  end
end
