class RemoveCategoryIdColumnFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :books, :category, index: true, foreign_key: true
  end
end
