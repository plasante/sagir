class AddIndexToUsagersEmail < ActiveRecord::Migration
  def change
    add_index :usagers, :email, unique: true
  end
end
