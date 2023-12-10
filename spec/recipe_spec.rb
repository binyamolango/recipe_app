require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  subject { Recipe.new(name: 'Apple Pie', description: 'Delicious pie recipe', preparation_time: 30, cooking_time: 60, user: user) }

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates maximum length of name' do
    subject.name = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'validates presence of user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'validates preparation_time to be greater or equal to zero' do
    subject.preparation_time = -1
    expect(subject).to_not be_valid
  end

  it 'validates cooking_time to be greater or equal to zero' do
    subject.cooking_time = -10
    expect(subject).to_not be_valid
  end

  it 'returns the correct name' do
    expect(subject.name).to eq 'Apple Pie'
  end

  it 'returns the correct description' do
    expect(subject.description).to eq 'Delicious pie recipe'
  end

  it 'returns the correct preparation_time' do
    expect(subject.preparation_time).to eq 30
  end

  it 'returns the correct cooking_time' do
    expect(subject.cooking_time).to eq 60
  end

  it 'returns the correct user' do
    expect(subject.user).to eq user
  end
end
