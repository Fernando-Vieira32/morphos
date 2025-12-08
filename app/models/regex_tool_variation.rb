class RegexToolVariation < ApplicationRecord
  belongs_to :regex_tool

  validates :key, :label, presence: true
  validates :key, uniqueness: { scope: :regex_tool_id }

  # Return pattern or nil (for 'all' or similar)
  def regex_pattern
    pattern.presence
  end

  def translated_label
    tool_key = regex_tool.name.parameterize(separator: '_')
    I18n.t("regex_tools.#{tool_key}.variations.#{key}.label", default: label)
  end

  def translated_description
    tool_key = regex_tool.name.parameterize(separator: '_')
    I18n.t("regex_tools.#{tool_key}.variations.#{key}.description", default: description)
  end

  def frontend_hash
    {
      id: id,
      key: key,
      label: translated_label,
      pattern: pattern,
      description: translated_description
    }
  end
end
