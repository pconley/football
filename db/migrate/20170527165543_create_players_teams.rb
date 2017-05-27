class CreatePlayersTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :players_teams do |t|
      t.integer :player_id
      t.integer :team_id
      t.string :position
    end
  end
end