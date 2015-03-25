class AddBottomlessMimosaPriceCol < ActiveRecord::Migration
  def change
    add_column :restaurants, :btm_price, :float
  end
end
