require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    xit 'validates :name, :price, :quantity, :category presence: true' do
      @category = "electronics"
      @product = Product.create(name: "USB typewriter", price: 2350, quantity: 2, category: @category)
      expect(@product.name, @product.price, @product.quantity, @product.category).not_to eq(nil)

    end
    
    it 'validates :name, presence: true' do
      @product = Product.create(price: 2350, quantity: 2, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates :price, presence: true' do
      @product = Product.create(name: "USB typewriter", quantity: 2, category: @category)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates :quantity, presence: true' do
      @product = Product.create(name: "USB typewriter", price: 2350, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates :category, presence: true' do
      @product = Product.create(name: "USB typewriter", price: 2350, quantity: 2)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end