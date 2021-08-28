class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.integer :name, null: false, default: 0
      t.integer :year, null: false

      t.timestamps
    end
  end
end
