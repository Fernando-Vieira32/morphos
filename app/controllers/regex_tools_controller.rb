class RegexToolsController < ApplicationController
  def index
    @tools = RegexTool.includes(:regex_tool_variations).order(:id)

    @tools_json = @tools.each_with_object({}) do |tool, hash|
      hash[tool.id.to_s] = {
        id: tool.id,
        name: tool.name,
        description: tool.description
      }
    end.to_json

    @variations_json = @tools.each_with_object({}) do |tool, hash|
      hash[tool.id.to_s] = tool.regex_tool_variations.order(:id).map do |v|
        { id: v.id, pattern: v.pattern, label: v.label, description: v.description }
      end
    end.to_json
  end
end
