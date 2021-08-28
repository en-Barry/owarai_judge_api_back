class Finalist < ApplicationRecord
  has_many :judgements, foreign_key: "reference_id"
end
