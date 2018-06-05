require 'rails_helper'

RSpec.describe Genre, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "runs model instance method average_rating " do
    it "returns average movie rating for a specific genre" do
      director = Director.create(name: "Alec Baldwin")
      genre = Genre.create(name: "Horror")
      movie_1 = genre.movies.create(title: "Mean Girls", description: "High school girls are mean.", director_id: director.id, movie_rating: 3)
      movie_2 = genre.movies.create(title: "Boss Baby", description: "A baby is a boss.", director_id: director.id, movie_rating: 4)
      movie_3 = genre.movies.create(title: "Catch Me If You Can", description: "Boy becomes expert in check fraud", director_id: director.id, movie_rating: 5)

      expect(genre.average_rating).to eq(4)
    end
  end
end
