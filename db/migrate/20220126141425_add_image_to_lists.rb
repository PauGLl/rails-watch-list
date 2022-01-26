class AddImageToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :bgimage, :string
  end
end
