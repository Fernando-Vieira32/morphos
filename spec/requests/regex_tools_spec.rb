require 'rails_helper'

RSpec.describe 'RegexTools' do
  describe 'GET #index', type: :request do
    subject(:index) { get regex_tools_path }

    let!(:regex_tool_variation) { create(:regex_tool_variation) }

    context 'when sucess' do
      it_behaves_like 'a request'
      it { index and expect(response).to render_template(:index) }
      it { index and expect(assigns(:tools)).to include(regex_tool_variation.regex_tool) }
      it { index and expect(assigns(:tools_json)).to be_present }
      it { index and expect(assigns(:variations_json)).to be_present }
    end
  end
end
