class RemoveForeignKeyFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :books, categories, column: :category_id
  end
end
