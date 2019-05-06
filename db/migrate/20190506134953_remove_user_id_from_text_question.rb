class RemoveUserIdFromTextQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :text_questions, :user_id, :integer
  end
end
