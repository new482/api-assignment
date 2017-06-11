class CannotBeNull < ActiveRecord::Migration[5.0]
  def change
  	change_column :todos, :subject, :string, null: false
  	change_column :todos, :status, :string, null: false
  end
end
