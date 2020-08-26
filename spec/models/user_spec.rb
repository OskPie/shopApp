require 'rails_helper'

RSpec.describe User, type: :model do
  # Constants
  let(:email_format) { /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  it { expect(described_class::EMAIL_FORMAT).to match(email_format) }

  # Validations
  before { create :user }

  it { is_expected.to validate_presence_of(:firstname) }
  it { is_expected.to validate_presence_of(:lastname) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value('valid@email.com').for(:email) }
  it { is_expected.to validate_presence_of(:password) }
end
