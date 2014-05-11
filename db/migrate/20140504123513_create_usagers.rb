class CreateUsagers < ActiveRecord::Migration
  def change
    create_table :usagers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
