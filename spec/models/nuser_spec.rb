require 'rails_helper'

RSpec.describe Nuser, type: :model do
  context 'validation test' do
    it 'ensures user email presence' do
      user = Nuser.new(encrypted_password: "password").save
      expect(user).to eq(false) 
    end

    it 'ensures user password presence' do
      user = Nuser.new(email: "abx@gmail.com").save
      expect(user).to eq(false) 
    end
  end
end
