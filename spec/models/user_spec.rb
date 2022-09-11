require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'schema' do
    context 'column' do
      it { should have_db_column(:id).of_type(:integer).with_options(primary: true, null: false) }
      it { should have_db_column(:email).of_type(:string).with_options(default: '', null: false) }
      it { should have_db_column(:encrypted_password).of_type(:string).with_options(default: '', null: false) }
      it { should have_db_column(:reset_password_token).of_type(:string) }
      it { should have_db_column(:reset_password_sent_at).of_type(:datetime).with_options(precision: 6) }
      it { should have_db_column(:remember_created_at).of_type(:datetime).with_options(precision: 6) }
      it { should have_db_column(:created_at).of_type(:datetime).with_options(precision: 6, null: false) }
      it { should have_db_column(:updated_at).of_type(:datetime).with_options(precision: 6, null: false) }
      it { should have_db_column(:username).of_type(:string).with_options(default: '', null: false) }
    end

    context 'index' do
      it { should have_db_index(:email).unique(true) }
      it { should have_db_index(:reset_password_token).unique(true) }
      it { should have_db_index(:username).unique(true) }
    end
  end

  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'validations' do
    context ':username' do
      it { should validate_length_of(:username).is_at_least(3).is_at_most(25) }
      it { should validate_uniqueness_of(:username).case_insensitive }
    end
  end
end
