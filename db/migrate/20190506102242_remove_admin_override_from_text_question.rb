class RemoveAdminOverrideFromTextQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :text_questions, :admin_override, :boolean
  end
end
