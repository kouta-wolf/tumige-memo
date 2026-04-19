class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.string :title, null: false, index: { unique: true, name: "unique_titles" }
      t.string :publisher
      t.date :release_date

      t.timestamps
    end
  end
end
