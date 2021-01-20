class AddColumnToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, foreign_key: true
    # add_column :tasks, :description, :string
  end
end
