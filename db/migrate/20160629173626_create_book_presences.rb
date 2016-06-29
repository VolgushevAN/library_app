class CreateBookPresences < ActiveRecord::Migration
  def change
    create_table :book_presences do |t|
      t.references :library, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.integer :count
      t.integer :on_hands

      t.timestamps null: false
    end
  end
end
