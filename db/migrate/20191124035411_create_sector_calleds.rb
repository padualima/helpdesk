class CreateSectorCalleds < ActiveRecord::Migration[5.2]
  def change
    create_table :sector_calleds do |t|
      t.references :sector, foreign_key: true

      t.timestamps
    end
  end
end
