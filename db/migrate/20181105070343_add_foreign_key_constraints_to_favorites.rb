class AddForeignKeyConstraintsToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :favorites, :users
  end
end
