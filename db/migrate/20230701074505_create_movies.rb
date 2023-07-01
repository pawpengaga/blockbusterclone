class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.references :client, foreign_key: true #null: false,

      t.timestamps
    end
  end
end
