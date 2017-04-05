class AddColumnProfilePublicIdToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :profile_public_id, :string, null: false
  end
end
