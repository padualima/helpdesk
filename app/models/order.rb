class Order < ApplicationRecord
  belongs_to :user
  belongs_to :sector_called
end
