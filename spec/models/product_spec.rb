require 'rails_helper'

RSpec.describe Product, type: :model do
  # Associations
  it { is_expected.to belong_to(:seller) }

  # Validations
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_numericality_of(:quantity).is_greater_than(0) }

  before { create(:product) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:code) }
end
