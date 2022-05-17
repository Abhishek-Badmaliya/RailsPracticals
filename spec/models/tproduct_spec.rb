require 'rails_helper'

RSpec.describe Tproduct, type: :model do
  context 'validation test' do
    it 'ensures product name presence' do
      product = Tproduct.new(price: 5, description: "For Reading").save
      expect(product).to eq(false) 
    end

    it 'ensures product price presence' do
      product = Tproduct.new(product_name: "News Paper", description: "For Reading").save
      expect(product).to eq(false) 
    end

    it 'ensures product description presence' do
      product = Tproduct.new(product_name: "News Paper", price:5).save
      expect(product).to eq(false) 
    end
  end
end
