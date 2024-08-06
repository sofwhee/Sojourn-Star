class AddChapterNumberToChapters < ActiveRecord::Migration[7.1]
  def change
    add_column :chapters, :chapter_number, :integer
  end
end
