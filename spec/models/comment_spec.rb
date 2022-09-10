require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  context 'validations :body' do
    it { should validate_length_of(:body).is_at_least(2).is_at_most(1000) }
  end
end
