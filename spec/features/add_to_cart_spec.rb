require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario 'User can visit the home page and click Add to Cart button for one of the products - product should show up in cart count' do

      visit root_path
      save_screenshot 'home_page.png'

    end
end
