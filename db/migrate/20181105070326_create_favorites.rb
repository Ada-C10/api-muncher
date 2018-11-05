class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.string :recipe_uri_fragment

      t.timestamps
    end
  end
end
