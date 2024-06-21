class RemoveImageFromPages < ActiveRecord::Migration[7.1]
  def change
    remove_column :pages, :image, :string
  end
end
