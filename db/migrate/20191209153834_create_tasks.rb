class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :category
      t.string :priority
      t.string :deadline
      t.boolean :completed
      t.integer :user_id
      t.integer :duration

      t.timestamps
    end
  end
end
