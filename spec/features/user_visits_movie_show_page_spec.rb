require 'rails_helper'

describe 'visitor' do
  context 'visits movies show page' do
    it 'should show all of the movies associated with that genre' do
      director = Director.create(name: "Alec Baldwin")
      movie = Movie.create(title: "Mean Girls", description: "High school girls are mean.", director_id: director.id)
      genre1 = movie.genres.create(name: "Horror")
      genre2 = movie.genres.create(name: "Thriller")

      visit movie_path(movie.slug)

      expect(page).to have_content("Genres for this Movie:")
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end
  end

  context 'visits movies show page' do
    it 'should show a movie rating for that movie 1 through 5' do
      director = Director.create(name: "Alec Baldwin")
      movie = Movie.create(title: "Mean Girls", description: "High school girls are mean.", director_id: director.id, movie_rating: 3)

      visit movie_path(movie.slug)

      expect(page).to have_content(movie.movie_rating)
    end
  end
end