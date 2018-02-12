class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :quiz_id
      t.string :content
      t.timestamps
    end
  end
end
