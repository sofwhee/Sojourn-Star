class AddPageNumberToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :page_number, :integer
  end
end
