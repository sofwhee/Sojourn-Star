class Chapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.string     :name
    end
  end
end
