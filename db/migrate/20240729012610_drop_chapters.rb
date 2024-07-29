class DropChapters < ActiveRecord::Migration[7.1]
  def change
    drop_table :chapters do |t|
      t.string :name
    end
  end
end
