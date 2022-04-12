class Product < ApplicationRecord
  validates :title, presence: { message: 'Title is required' }
  validates :description, presence: { message: 'Description is required' }
end
