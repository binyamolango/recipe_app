require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:recipe) { Recipe.create(name: 'Pasta', description: 'Delicious pasta recipe') }
  let(:food) { Food.create(name: 'Tomato', measurement_unit: 'grams', price: 0.5, quantity: 200) }
  subject { RecipeFood.new(quantity: 300, recipe:, food:) }

  it 'belongs to a recipe' do
    expect(subject.recipe).to eq recipe
  end

  it 'belongs to a food' do
    expect(subject.food).to eq food
  end

  it 'validates quantity to be greater or equal to zero' do
    subject.quantity = -10
    expect(subject).to_not be_valid
  end

  it 'validates quantity to be a number' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end
end
