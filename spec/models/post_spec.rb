require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'schema' do
    describe 'column' do
      it { should have_db_column(:id).of_type(:integer).with_options(primary: true, null: false) }
      it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }
      it { should have_db_column(:description).of_type(:text) }
      it { should have_db_column(:images).of_type(:json) }
      it { should have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
      it { should have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
    end

    describe 'index' do
      it { should have_db_index(:user_id) }
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'validations' do
    describe ':images' do
      it { should validate_presence_of(:images) }
    end

    describe ':description' do
      it { should validate_length_of(:description).is_at_most(2200) }
    end
  end
end
