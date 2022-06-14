class RemoveCategoryIdColumnFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :books, :category, index: true
  end
end
