require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', email: 'john@example.com', password: 'password') }

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'returns the correct name' do
    expect(subject.name).to eq 'John Doe'
  end

  it 'returns the correct email' do
    expect(subject.email).to eq 'john@example.com'
  end

  it 'returns the correct encrypted password' do
    expect(subject.encrypted_password).to_not be_nil
  end
end
