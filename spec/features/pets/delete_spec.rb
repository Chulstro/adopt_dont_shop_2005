require 'rails_helper'

RSpec.describe "When visiting a Pet's show page" do
  it "has a link to destroy that pet" do
    shelter_1 = Shelter.create(name: "Habitat for Hippos and Lemurs", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)

    pet_1 = shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
      name: "Gloria",
      description: "682 lbs of hugs and love",
      approx_age: 5,
      sex: "F")

      visit "/pets/#{pet_1.id}"
      expect(page).to have_content("Gloria")

      click_on "Delete Pet"

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Gloria")
  end
end
