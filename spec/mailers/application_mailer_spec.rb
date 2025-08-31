require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  describe 'configuration' do
    it { expect(described_class.superclass).to eq(ActionMailer::Base) }

    it { expect(described_class.default[:from]).to eq('from@example.com') }

    it { expect(described_class._layout).to eq('mailer') }
  end
end
