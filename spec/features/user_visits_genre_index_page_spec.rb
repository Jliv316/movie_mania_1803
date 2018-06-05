require 'rails_helper'

describe 'visitor' do
  context 'visits genres index page' do
    it 'should not show create new genres button, visitor sees all genres in database' do

      genre1 = Genre.create(name: "Horror")
      genre2 = Genre.create(name: "Action")

      visit genres_path

      expect(page).to_not have_field('genre[name]')
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to_not have_content("Create Genre")
    end
  end

  context 'visits genres index page' do
    it 'visitor sees all genres in database and clicks on genre name to go to that genres show page' do

      genre1 = Genre.create(name: "Horror")
      genre2 = Genre.create(name: "Action")

      visit genres_path
      click_on "#{genre1.name}"
      
      expect(current_path).to eq(genre_path(genre1))
    end
  end
end