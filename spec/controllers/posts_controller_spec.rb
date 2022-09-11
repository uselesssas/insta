require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create :user }
  before { sign_in user }

  describe '#index' do
    subject { process :index }
    let(:posts) { create_list(:post, 5) }

    it '' do
      subject
      expect(response).to render_template :index
    end
  end
end
