class CreateGarbageTickets < ActiveRecord::Migration
  def change
    create_table :garbage_tickets do |t|
      t.string :location
      t.integer :level
      t.string :remark
      t.string :mobile
      t.string :email
      t.double :latitude
      t.double :longitude
      t.boolean :is_open

      t.timestamps
    end
  end
end
