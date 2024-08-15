class AddSlugToPages < ActiveRecord::Migration[7.1]
  StrongMigrations.disable_check(:add_index)
  
  def change
    add_column :pages, :slug, :string
    add_index :pages, :slug, unique: true
  end
end
