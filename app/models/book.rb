class Book < ApplicationRecord
  has_many :comments
  before_destroy do
    comments.each(&:destroy)
  end

  validates :author, presence: true, length: {minimum: 3}
  validates :title, presence: true, length: {minimum: 3}
end
