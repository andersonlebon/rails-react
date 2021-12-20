# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[6.1] # rubocop:todo Style/Documentation
  def change
    create_table :messages do |t|
      t.text :text

      t.timestamps
    end
  end
end
