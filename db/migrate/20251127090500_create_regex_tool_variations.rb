class CreateRegexToolVariations < ActiveRecord::Migration[7.0]
  def change
    create_table :regex_tool_variations do |t|
      t.references :regex_tool, null: false, foreign_key: true
      t.string :key, null: false
      t.string :label, null: false
      t.string :pattern
      t.text :description

      t.timestamps
    end
    add_index :regex_tool_variations, [:regex_tool_id, :key], unique: true
  end
end
