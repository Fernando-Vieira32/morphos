class RegexToolsController < ApplicationController
  def index
    @tools = RegexTool.includes(:regex_tool_variations).order(:id)

    variations = {}
    @tools.each do |t|
      variations[t.id] = t.variations.map(&:frontend_hash)
    end

    @variations_json = variations.to_json

  end
end
