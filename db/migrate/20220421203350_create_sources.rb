class CreateSources < ActiveRecord::Migration[6.1]
  def change
    create_table :sources do |t|
      t.string :kind
      t.boolean :verified
      t.string :parser_name
      t.json :details

      t.timestamps
    end
  end
end
