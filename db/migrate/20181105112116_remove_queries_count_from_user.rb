class RemoveQueriesCountFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :queries_count
  end
end
