class ChangePriceToNum < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :price, 'integer USING CAST(price AS integer)'
  end
end
