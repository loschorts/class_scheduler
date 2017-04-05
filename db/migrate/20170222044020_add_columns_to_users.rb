class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :f_name, :string, null: false
  	add_column :users, :l_name, :string, null: false
    add_column :users, :profile_src, :string
  	add_column :users, :type, :string, 
  		null: false
  	add_column :users, :language, :string, 
  		null: false, default: "en"

  	add_index :users, :f_name
  	add_index :users, :l_name
  end
end
