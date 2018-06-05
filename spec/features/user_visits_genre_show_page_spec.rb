require 'rails_helper'

describe 'visitor' do
  context 'visits genres show page' do
    it 'should show all of the movies associated with that genre' do
      director = Director.create(name: "Alec Baldwin")
      genre1 = Genre.create(name: "Horror")
      movie_1 = genre1.movies.create(title: "Mean Girls", description: "High school girls are mean.", director_id: director.id)
      movie_2 = genre1.movies.create(title: "Boss Baby", description: "A baby is a boss.", director_id: director.id)
      movie_3 = genre1.movies.create(title: "Catch Me If You Can", description: "Boy becomes expert in check fraud", director_id: director.id)

      visit genre_path(genre1)

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content(movie_3.title)
    end
  end

  context 'visits genres show page' do
    it 'should show all of the movies associated with that genre' do
      director = Director.create(name: "Alec Baldwin")
      genre = Genre.create(name: "Horror")
      movie_1 = genre.movies.create(title: "Mean Girls", description: "High school girls are mean.", director_id: director.id, movie_rating: 3)
      movie_2 = genre.movies.create(title: "Boss Baby", description: "A baby is a boss.", director_id: director.id, movie_rating: 4)
      movie_3 = genre.movies.create(title: "Catch Me If You Can", description: "Boy becomes expert in check fraud", director_id: director.id, movie_rating: 5)

      visit genre_path(genre)

      expect(page).to have_content(genre.average_rating)
    end
  end
end