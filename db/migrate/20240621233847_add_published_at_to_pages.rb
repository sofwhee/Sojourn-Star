class AddPublishedAtToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :published_at, :datetime
  end
end
