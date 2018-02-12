class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :question_id
      t.boolean :solution?, default: false
      t.timestamps
    end
  end
end
