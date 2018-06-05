class AddColumnToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :movie_rating, :integer
  end
end
