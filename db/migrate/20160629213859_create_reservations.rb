class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :state, default: 0
      t.datetime :date
      t.references :user
      t.references :book_presence, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
