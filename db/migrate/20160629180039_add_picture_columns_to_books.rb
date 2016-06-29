class AddPictureColumnsToBooks < ActiveRecord::Migration
  def up
    add_attachment :books, :picture
  end

  def down
    remove_attachment :books, :picture
  end
end
