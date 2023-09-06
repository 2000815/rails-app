class CreateShopViewHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_view_histories do |t|
      t.integer :shop_id
      t.integer :count

      t.timestamps
    end
  end
end
