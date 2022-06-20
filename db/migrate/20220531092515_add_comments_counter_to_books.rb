class AddCommentsCounterToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :comments_counter, :integer, default: 0
  end
end
