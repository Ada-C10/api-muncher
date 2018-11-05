class AddToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :creator, :string
    add_column :recipes, :image, :string
    add_column :recipes, :recipe_link, :string
    add_column :recipes, :ingredients, :string, array: true, default: []
    add_column :recipes, :dietary_label, :string, array: true, default: []
  end
end
