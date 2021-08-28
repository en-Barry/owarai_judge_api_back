class Judgement < ApplicationRecord
  belongs_to :contest
  belongs_to :judge
  belongs_to :finalist
end
