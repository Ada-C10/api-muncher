class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :uid, null: false
      t.string :provider, null: false
      t.string :favorites, array: true

      t.timestamps
    end
  end
end
