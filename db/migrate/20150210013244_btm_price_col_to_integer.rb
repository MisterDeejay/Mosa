class BtmPriceColToInteger < ActiveRecord::Migration
  def change
    remove_column :restaurants, :btm_price
    add_column :restaurants, :btm_price, :integer
  end
end
