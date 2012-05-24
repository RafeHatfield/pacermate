class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :racing_name
      t.string :stable_name
      t.integer :sex
      t.string :colour
      t.date :foal_date
      t.integer :user_id

      t.timestamps
    end
    add_index :horses, [:user_id]
    add_index :horses, [:racing_name]
    add_index :horses, [:stable_name]
  end
end
