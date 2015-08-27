require 'rails_helper'

describe User do
  let(:good_user) { User.new(name: 'Antonio', email: 'antonio@gmail.com', password_digest: '12345')}
  let(:bad_user_name) { User.new(email: 'antonio.gmail.com', password_digest: '12345')}
  let(:bad_user_email) { User.new(name: 'Antonio', password_digest: '12345')}
  let(:bad_user_password) { User.new(name: 'Antonio', email: 'antonio.gmail.com')}

  it 'this is a canary test' do
    expect(true).to be(true)
  end

  it 'should be valid with all fields present' do
    expect(good_user).to be_valid
  end

  it 'should correctly assign attributes' do
    expect(good_user.name).to eq('Antonio')
    expect(good_user.email).to eq('antonio@gmail.com')
    expect(good_user.password_digest).to eq('12345')
  end

  it 'should be invalid without a name' do
    expect(bad_user_name).to be_invalid
  end

  it 'should be invalid without an email' do
    expect(bad_user_email).to be_invalid
  end

  it 'should be invalid without an password' do
    expect(bad_user_password).to be_invalid
  end
end
