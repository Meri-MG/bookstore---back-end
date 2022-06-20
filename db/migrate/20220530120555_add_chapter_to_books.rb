class AddChapterToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :chapter, :integer
  end
end
