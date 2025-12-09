module RegexToolsHelper
  def variations_tools_collection(tools)
    tools.flat_map do |tool|
      tool.regex_tool_variations.order(:id)
    end
  end
end
