class AddPriceToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :price, :decimal
  end
end
