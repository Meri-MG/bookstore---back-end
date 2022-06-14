class Book < ApplicationRecord
  has_many :comments

  validates :author, presence: true, length: {minimum: 3}
  validates :title, presence: true, length: {minimum: 3}
end
