class AddAnswerToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :answer, :text
  end
end
