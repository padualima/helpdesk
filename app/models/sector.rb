class Sector < ApplicationRecord
  has_many :users
  has_one :sector_called
end
