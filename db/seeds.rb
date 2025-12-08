# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seeds for Regex tools and variations

# Idempotent creation of a basic "Counter" tool and variations
tool = RegexTool.find_or_create_by!(name: 'counter') do |t|
	t.description = 'Tool for counting characters, words and patterns.'
end

variations = [
	{ key: 'all', label: 'All characters', pattern: nil, description: 'Counts all characters.' },
	{ key: 'letters', label: 'Letters (A-Z)', pattern: '[A-Za-z]', description: 'Counts latin letters (no accents).' },
	{ key: 'digits', label: 'Digits', pattern: '\\d', description: 'Counts digits 0-9.' },
	{ key: 'words', label: 'Words', pattern: '\\b\\w+\\b', description: 'Counts words (separated by spaces).'},
	{ key: 'uppercase', label: 'Uppercase letters', pattern: '[A-Z]', description: 'Counts uppercase letters.' },
	{ key: 'whitespace', label: 'Whitespace', pattern: '\\s', description: 'Counts spaces, tabs and line breaks.' }
]

variations.each do |v|
	tool.regex_tool_variations.find_or_create_by!(key: v[:key]) do |rv|
		rv.label = v[:label]
		rv.pattern = v[:pattern]
		rv.description = v[:description]
	end
end
