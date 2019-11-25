class Order < ApplicationRecord
  require 'date'
  belongs_to :user
  belongs_to :sector_called
end
