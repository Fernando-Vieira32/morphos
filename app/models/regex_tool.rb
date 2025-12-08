class RegexTool < ApplicationRecord
  has_many :regex_tool_variations, dependent: :destroy

  validates :name, presence: true

  def variations
    regex_tool_variations.order(:id)
  end

  def key
    name.parameterize(separator: '_')
  end
end
