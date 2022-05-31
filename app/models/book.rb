class Book < ApplicationRecord
  belongs_to :category, foreign_key: 'category_id'
  has_many :comments

  validates :author, presence: true, length: {minimum: 3}
  validates :title, presence: true, length: {minimum: 3}
end
