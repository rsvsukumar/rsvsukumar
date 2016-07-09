class CreateArtistProfiles < ActiveRecord::Migration
  def change
    create_table :artist_profiles do |t|
      t.integer :artist_id
      t.string :gender
      t.string :title
      t.string :first
      t.string :last
      t.string :street
      t.string :city
      t.string :state
      t.string :postcode
      t.string :email
      t.string :large
      t.string :medium
      t.string :thumbnail

      t.timestamps null: false
    end
  end
end
