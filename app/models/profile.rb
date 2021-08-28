class Profile < ApplicationRecord
  belongs_to :judges

  enum age: { teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, sixties: 6, seventies: 7}
  enum gender: { male: 0, female: 1 }
end
