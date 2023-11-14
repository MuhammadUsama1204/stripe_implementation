class Product < ApplicationRecord
  validates :title, :quantity, presence: true
end
