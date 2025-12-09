class RegexTool < ApplicationRecord
  has_many :regex_tool_variations, dependent: :destroy

  validates :name, presence: true
end
