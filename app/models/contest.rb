class Contest < ApplicationRecord

  enum name: { 'M-1グランプリ': 0, 'キングオブコント': 1, 'R-1グランプリ': 2}
end
