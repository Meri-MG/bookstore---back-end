class Comment < ApplicationRecord
  belongs_to :book, foreign_key: 'book_id'

  after_create :update_comments_count

  validates :text, presence: true, length: {minimum: 3}

  private

  def update_comments_count
    book.increment!(:comments_counter)
  end
end
