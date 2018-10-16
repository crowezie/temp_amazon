class ChangeTypeOfPriceColumnInProductsToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :float
  end
  # If you wanted to make this migration reversible (rails db:rollback)
  # you would need to write it like below. Otherwise Rails doesn't know
  # what the def change should rollback to.

  # def up
  #   change_column :products, :price, :float
  # end
  #
  # def down
  #   change_column :products, :price, :integer
  # end
end
