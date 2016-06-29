class Book < ActiveRecord::Base
  has_many :book_presences, dependent: :destroy
  has_many :libraries, through: :book_presences

  has_attached_file :picture, styles: { thumb: 'x100', medium: 'x500', large: 'x1000>' }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
