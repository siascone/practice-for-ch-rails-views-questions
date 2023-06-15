class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :user_id, null: false
      t.string :subject, null: false
      t.string :body, null: false
      t.timestamps
    end

    add_index :questions, :user_id
  end
end
