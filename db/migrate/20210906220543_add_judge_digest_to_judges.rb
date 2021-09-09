class AddJudgeDigestToJudges < ActiveRecord::Migration[6.0]
  def change
    add_column :judges, :judge_digest, :string, null: false
  end
end
