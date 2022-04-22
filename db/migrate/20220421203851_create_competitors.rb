class CreateCompetitors < ActiveRecord::Migration[6.1]
  def change
    create_table :competitors do |t|
      t.string :name
      t.string :similar_names
      t.references :ligue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
