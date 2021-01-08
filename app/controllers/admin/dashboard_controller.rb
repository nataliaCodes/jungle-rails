class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :name => ENV['ADMIN_USERNAME'], :password => ENV['ADMIN_PASS']

  def show

    @products_nr = Product.count
    @categories_nr = Category.count
    @categories = Category.all

    @apparel = Category.find(id=1)
    @electronics = Category.find(id=2)
    @furniture = Category.find(id=3)

  end
end
