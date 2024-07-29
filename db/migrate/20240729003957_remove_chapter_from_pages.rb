class RemoveChapterFromPages < ActiveRecord::Migration[7.1]
  def change
    remove_column :pages, :chapter, :integer
  end
end
