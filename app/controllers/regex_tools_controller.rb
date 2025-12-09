class RegexToolsController < ApplicationController
  def index
    @tools = RegexTool.includes(:regex_tool_variations).order(:id)
    @tools_json = _build_tools_json
    @variations_json = _build_variations_json
  end

  private

  def _build_tools_json
    tools_hash = @tools.each_with_object({}) do |tool, hash|
      tool_id = tool.id.to_s
      hash[tool_id] = _tool_attributes(tool)
    end
    tools_hash.to_json
  end

  def _build_variations_json
    variations_hash = @tools.each_with_object({}) do |tool, hash|
      tool_id = tool.id.to_s
      hash[tool_id] = _tool_variations(tool)
    end
    variations_hash.to_json
  end

  def _tool_attributes(tool)
    {
      id: tool.id,
      name: tool.name,
      description: tool.description
    }
  end

  def _tool_variations(tool)
    tool.regex_tool_variations.order(:id).map do |variation|
      _variation_attributes(variation)
    end
  end

  def _variation_attributes(variation)
    {
      id: variation.id,
      pattern: variation.pattern,
      label: variation.label,
      description: variation.description
    }
  end
end
