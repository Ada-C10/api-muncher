class AddSearchTermToQueries < ActiveRecord::Migration[5.2]
  def change
    add_column :queries, :search_term, :string
  end
end
