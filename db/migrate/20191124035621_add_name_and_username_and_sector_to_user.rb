class AddNameAndUsernameAndSectorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_reference :users, :sector, foreign_key: true
  end
end
