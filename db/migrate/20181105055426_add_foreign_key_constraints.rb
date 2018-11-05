class AddForeignKeyConstraints < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :queries, :users
  end
end
