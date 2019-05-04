class AddLockedToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :text_questions, :locked, :boolean
  end
end
