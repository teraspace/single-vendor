# This migration comes from spree_duna_base_theme (originally 20200510143348)
class AddSalePriceToSpreeVariants < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_variants, :sale_price, :decimal
  end
end
