class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :year
      t.integer :country_id

      t.timestamps
    end
  end
end
