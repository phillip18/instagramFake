class AddUserIdToPics < ActiveRecord::Migration[5.0]
  def change
    add_column :pics, :uder_id, :integer
    add_index :pics, :uder_id
  end
end
