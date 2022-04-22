class CreateHighlights < ActiveRecord::Migration[6.1]
  def change
    create_table :highlights do |t|
      t.references :competitor_1, null: false, foreign_key: {to_table: 'competitors'}
      t.string :references
      t.references :competitor_2, null: false, foreign_key: {to_table: 'competitors'}
      t.references :source, null: false, foreign_key: true
      t.string :link
      t.string :external_id
      t.string :datetime

      t.timestamps
    end
  end
end
