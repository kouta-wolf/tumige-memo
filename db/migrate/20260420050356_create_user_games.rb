class CreateUserGames < ActiveRecord::Migration[8.1]
  def change
    create_table :user_games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.integer :score

      t.timestamps
    end
    add_index :user_games, [ :user_id, :game_id ], unique: true
  end
end
