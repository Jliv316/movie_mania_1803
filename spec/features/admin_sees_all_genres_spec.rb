require 'rails_helper'

describe "User visits genres index page" do
  context "as admin" do
    it "I see a list of all genre names in the database." do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre1 = Genre.create(name: "Horror")
      genre2 = Genre.create(name: "Action")

      visit admin_genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end
  end

  context "as admin" do
    it "I see a form to create a new genre." do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      expect(current_path).to eq(admin_genres_path)
      expect(page).to have_field('genre[name]')
      expect(page).to have_button('Create Genre')
    end
  end

  context "as admin" do
    it "I see a list of all genre names in the database." do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre1 = Genre.create(name: "Horror")
      genre2 = Genre.create(name: "Action")

      visit admin_genres_path
      fill_in 'genre[name]', with: 'Thriller'
      click_on "Create Genre"

      expect(current_path).to eq(admin_genres_path)
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content('Thriller')
    end
  end
end