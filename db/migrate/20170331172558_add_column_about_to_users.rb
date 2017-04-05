class AddColumnAboutToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :about, :string, limit: 140, null: false
  end
end
