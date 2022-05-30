class Book < ApplicationRecord
  belongs_to :category, foreign_key: 'category_id'

  validates :author, presence: true, length: {minimum: 3}
  validates :title, presence: true, length: {minimum: 3}
end
