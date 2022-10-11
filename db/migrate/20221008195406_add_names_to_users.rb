# frozen_string_literal: true

# Add first_name and last_name to Users
class AddNamesToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table(:users, bulk: true) do |t|
      t.column :first_name, :string
      t.column :last_name, :string
    end
  end
end
