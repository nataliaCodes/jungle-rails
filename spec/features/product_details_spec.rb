require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
    
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

  scenario "User can navigate from the home page to the product detail page by clicking on a product" do
    # ACT
    visit root_path
    save_screenshot 'home_page.png'

    #find all article.product elements
    #then focus first one
    # within find('article.product') do
    #   first('footer').trigger('focus')
    # end

    # first('article.product').trigger('focus')
    # save_screenshot 'focused_product.png'

    find("Details &raquo;", visible: false).click

    # click_on 'Details &raquo;'
    save_screenshot 'after_details.png'



  end

end
