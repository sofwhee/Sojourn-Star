class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.integer :chapter
      t.integer :page
      t.string :image

      t.timestamps
    end
  end
end
