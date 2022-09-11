require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'schema' do
    it { should have_db_column(:id).of_type(:integer).with_options(primary: true, null: false) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:images).of_type(:json) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }

    it { should have_db_index(:user_id) }
  end

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
