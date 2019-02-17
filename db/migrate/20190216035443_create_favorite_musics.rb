class CreateFavoriteMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_musics do |t|
	    t.string :music_name
      t.string :artist_name
      t.text :image_id
      t.text :introduction
      t.text :music_url
      t.integer :user_id
      t.timestamps
    end
  end
end
