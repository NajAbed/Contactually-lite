class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.float :phone_number
      t.string :company_name

      t.timestamps null: false
    end
    #add_attachment :tracks, :gpx
  end
end
