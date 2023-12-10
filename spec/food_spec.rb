require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.new(name: 'Apple', measurement_unit: 'grams', price: 1.99, quantity: 100) }

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of measurement_unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'validates price to be greater or equal to zero' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'validates quantity to be greater or equal to zero' do
    subject.quantity = -10
    expect(subject).to_not be_valid
  end

  it 'validates quantity to be a number' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end

  it 'returns the correct name' do
    expect(subject.name).to eq 'Apple'
  end

  it 'returns the correct measurement_unit' do
    expect(subject.measurement_unit).to eq 'grams'
  end

  it 'returns the correct price' do
    expect(subject.price).to eq 1.99
  end

  it 'returns the correct quantity' do
    expect(subject.quantity).to eq 100
  end
end
