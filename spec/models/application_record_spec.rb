require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  describe 'configuration' do
    it 'is an abstract class' do
      expect(described_class.abstract_class).to be_truthy
    end

    it 'inherits from ActiveRecord::Base' do
      expect(described_class.superclass).to eq(ActiveRecord::Base)
    end
  end
end
