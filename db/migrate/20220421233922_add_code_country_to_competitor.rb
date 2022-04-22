class AddCodeCountryToCompetitor < ActiveRecord::Migration[6.1]
  def change
    add_column :competitors, :code, :string
    add_column :competitors, :country, :string
  end
end
