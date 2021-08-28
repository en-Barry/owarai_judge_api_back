class Judge < ApplicationRecord
  has_many :judgements, foreign_key: "reference_id"
  has_one :profile, dependent: :destroy

  enum category: { general: 0, official: 1 }
end
