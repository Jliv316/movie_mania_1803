class ChangeColumnMovies < ActiveRecord::Migration[5.1]
  def change
    change_column :movies, :movie_rating, :integer, default: 0
  end
end
