# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  subject { user }

  describe 'when responds to email, password etc' do
    it { expect(user).to respond_to(:email) } # expect é mais atual que should
    it { should respond_to(:password) } # shoulda matchers
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:token) }
  end

  describe 'when email is present' do
    it { should be_valid }
  end

  describe 'when email is not present' do
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_confirmation_of(:password) }
    it { should validate_presence_of(:email) }
    it { should allow_value('email@domain.com').for(:email) }
    it { should validate_uniqueness_of(:token) }
  end
  
  describe '#generate_authentication_token!' do
    it 'generates unique token' do
      token = 'ae159b753cf852lt4y60' # -> criado um mock para gerar esse mesmo token pro teste
      allow(Devise).to receive(:friendly_token).and_return(token)
      user.generate_authentication_token!
      expect(user.token).to eq token
    end

    it 'generates another token when one has been taken' do
      existant_user = FactoryBot.create(:user, token: 'ae159b773cf822lt4y60')
      user.generate_authentication_token!
      expect(user.token).not_to eq existant_user.token
    end
  end

  describe 'associations' do
    it { should have_many :products}
  end
end
