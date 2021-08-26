class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.string :name, null: false
      t.integer :year, null: false
      t.string :judge, null: false
      t.string :finalist, null: false
      t.integer :score, null: false

      t.timestamps
    end
  end
end
