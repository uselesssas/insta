require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'schema' do
    describe 'column' do
      it { should have_db_column(:id).of_type(:integer).with_options(primary: true, null: false) }
      it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }
      it { should have_db_column(:post_id).of_type(:integer).with_options(null: false) }
      it { should have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
      it { should have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    end

    describe 'index' do
      it { should have_db_index(%i[post_id user_id]).unique(true) }
      it { should have_db_index(:post_id) }
      it { should have_db_index(:user_id) }
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'validations' do
    describe 'composite index [:user_id :post_id]' do
      subject { build(:like) }
      it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }
    end
  end
end
