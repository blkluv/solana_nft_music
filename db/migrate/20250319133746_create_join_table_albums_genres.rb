class CreateJoinTableAlbumsGenres < ActiveRecord::Migration[7.1]
  def change
    create_join_table :albums, :genres do |t|
      # t.index [:album_id, :genre_id]
      # t.index [:genre_id, :album_id]
    end
  end
end
