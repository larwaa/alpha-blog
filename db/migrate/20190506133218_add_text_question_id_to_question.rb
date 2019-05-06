class AddTextQuestionIdToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :text_questions_id, :integer
  end
end
