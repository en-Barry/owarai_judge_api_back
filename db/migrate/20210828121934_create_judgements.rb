class CreateJudgements < ActiveRecord::Migration[6.0]
  def change
    create_table :judgements do |t|
      t.references :contest, null: false, foreign_key: true
      t.references :judge, null: false, foreign_key: true
      t.references :finalist, null: false, foreign_key: true
      t.integer :score, null: false

      t.timestamps
    end
  end
end
