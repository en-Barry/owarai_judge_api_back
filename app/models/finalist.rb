class Finalist < ApplicationRecord
  has_many :judgements, foreign_key: "reference_id"

  scope :finalist_all, -> { pluck(:id, :name).map { |id, name| { id: id, name: name }} }
end
