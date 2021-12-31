class Book < ApplicationRecord
  validates_presence_of :price
  validates_presence_of :name
end
