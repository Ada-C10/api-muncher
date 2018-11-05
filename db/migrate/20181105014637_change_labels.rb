class ChangeLabels < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :dietary_label, :dietary_labels
  end
end
