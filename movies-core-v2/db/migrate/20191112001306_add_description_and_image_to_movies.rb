class AddDescriptionAndImageToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :description, :string
    add_column :movies, :image, :string
  end
end
