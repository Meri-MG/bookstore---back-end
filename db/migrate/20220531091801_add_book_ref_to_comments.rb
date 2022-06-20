class AddBookRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :book, foreign_key: true, index: true
  end
end
