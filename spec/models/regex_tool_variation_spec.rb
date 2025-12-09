require 'rails_helper'

RSpec.describe RegexToolVariation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:regex_tool) }
  end

  describe 'validations' do
    subject { build(:regex_tool_variation) }

    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_presence_of(:label) }
    it { is_expected.to validate_uniqueness_of(:key).scoped_to(:regex_tool_id) }
  end
end
