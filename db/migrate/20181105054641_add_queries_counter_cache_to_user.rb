class AddQueriesCounterCacheToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :queries_count, :integer
  end
end
