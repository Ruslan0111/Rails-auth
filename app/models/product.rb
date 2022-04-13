class Product < ApplicationRecord
  validates :title, presence: { message: 'Title is required' }
  validates :description, presence: { message: 'Description is required' }
  validates :company_id, presence: { message: 'Company id is required' }

  belongs_to :company
end
