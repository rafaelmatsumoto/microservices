class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :release_date
      t.belongs_to :genre, class_name: "genre", foreign_key: "genre_id"

      t.timestamps
    end
  end
end
