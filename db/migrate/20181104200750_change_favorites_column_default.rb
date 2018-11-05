class ChangeFavoritesColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :favorites, []
  end
end
