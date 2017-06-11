class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :subject
      t.string :content
      t.string :status

      t.timestamps
    end
  end
end
