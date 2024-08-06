class AddChaptersIdToPages < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!
  
  def change
    add_reference :pages, :chapter, index: {algorithm: :concurrently}
  end
end
