class Judgement < ApplicationRecord
  belongs_to :contest
  belongs_to :judges
  belongs_to :finalist
end
