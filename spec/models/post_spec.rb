require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  context 'validations :images' do
    it { should validate_presence_of(:images) }
  end

  context 'validations :description' do
    it { should validate_length_of(:description).is_at_most(2200) }
  end
end
