class ChangeContentColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :answers, :content, :result

  end
end
