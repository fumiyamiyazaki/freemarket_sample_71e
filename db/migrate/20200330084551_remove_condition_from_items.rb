class RemoveConditionFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :condition, :string
  end
end
