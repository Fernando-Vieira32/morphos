class RegexToolVariation < ApplicationRecord
  belongs_to :regex_tool

  validates :key, :label, presence: true
  validates :key, uniqueness: { scope: :regex_tool_id }
end
