class ChangeShopIdTypeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :shop_view_histories, :shop_id, :string
  end
end
