class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :release_date
      t.belongs_to :genre

      t.timestamps
    end
  end
end
