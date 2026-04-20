class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :user_game, null: false, foreign_key: true, index: { unique: true }
      t.text :content

      t.timestamps
    end
  end
end
