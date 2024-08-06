class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.integer :page
      t.string :image
      t.belongs_to :chapter, index: true, foreign_key: true

      t.timestamps
    end
  end
end
