class AddColumnToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :greeting, :string
  end
end
