class CreateJudges < ActiveRecord::Migration[6.0]
  def change
    create_table :judges do |t|
      t.string :name, null: false
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
