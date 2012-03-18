class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.float :geoloc_lat
      t.float :geoloc_long

      t.timestamps
    end
  end
end
