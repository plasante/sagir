class AddPasswordDigestToUsagers < ActiveRecord::Migration
  def change
    add_column :usagers, :password_digest, :string
  end
end
