class AddDetailsToTextQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :text_questions, :question, :text
    add_column :text_questions, :tooltip, :text
    add_column :text_questions, :answer, :text
    add_column :text_questions, :rows, :integer
  end
end
