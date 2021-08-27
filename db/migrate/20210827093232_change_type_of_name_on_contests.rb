class ChangeTypeOfNameOnContests < ActiveRecord::Migration[6.0]
  def change
    change_column :contests, :name, :integer, default: 0
  end
end
