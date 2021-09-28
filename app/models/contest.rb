class Contest < ApplicationRecord
  has_many :judgements, foreign_key: "reference_id"

  enum name: { 'M-1グランプリ': 0, 'キングオブコント': 1, 'R-1グランプリ': 2}

  scope :contest_all, -> { order(id: :DESC).pluck(:id, :name, :year).map { |id, name, year| { id: id, name: name, year: year }} }
end
