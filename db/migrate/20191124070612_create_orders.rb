class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :sector_called, foreign_key: true
      t.string :title
      t.text :description
      t.integer :user_finished
      t.date :date_finished
      t.string :status
      t.string :priority

      t.timestamps
    end
  end
end
