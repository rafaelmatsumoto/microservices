class AddMovieIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :movie_id, :integer
  end
end
