class Favorite < ApplicationRecord
  belongs_to :user
  validates :recipe_uri_fragment, presence: true
  validates :recipe_uri_fragment, uniqueness: { scope: :user, message: "Recipe already in your favorites!" }
end
