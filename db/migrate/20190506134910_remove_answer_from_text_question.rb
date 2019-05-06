class RemoveAnswerFromTextQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :text_questions, :answer, :text
  end
end
