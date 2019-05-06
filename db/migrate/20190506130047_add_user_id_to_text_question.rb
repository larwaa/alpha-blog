class AddUserIdToTextQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :text_questions, :user_id, :integer
  end
end
