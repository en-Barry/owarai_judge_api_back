class RemoveUserDigestFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :user_digest, :string
  end
end
