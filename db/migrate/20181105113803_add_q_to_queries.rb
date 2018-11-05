class AddQToQueries < ActiveRecord::Migration[5.2]
  def change
    add_column :queries, :q, :string
  end
end
