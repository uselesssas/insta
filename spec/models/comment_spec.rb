require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'schema' do
    it { should have_db_column(:id).of_type(:integer).with_options(primary: true, null: false) }
    it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:post_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }

    it { should have_db_index(:post_id) }
    it { should have_db_index(:user_id) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  context 'validations :body' do
    it { should validate_length_of(:body).is_at_least(2).is_at_most(1000) }
  end
end
