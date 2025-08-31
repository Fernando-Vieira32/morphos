require 'rails_helper'

RSpec.describe 'Home' do
  describe 'GET #index', type: :request do
    subject(:index) { get home_index_path }

    context 'when sucess' do
      it_behaves_like 'a request'
      it { index and expect(response).to render_template(:index) }
    end
  end
end
