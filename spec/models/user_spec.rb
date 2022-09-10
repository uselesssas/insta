require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  context 'validations :username' do
    it { should validate_length_of(:username).is_at_least(3).is_at_most(25) }
    it { should validate_uniqueness_of(:username).case_insensitive }
  end
end
