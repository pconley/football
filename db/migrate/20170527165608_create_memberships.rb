class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.integer :player_id
      t.integer :team_id
      t.string :position
      t.boolean :isCaptain
    end
  end
end
