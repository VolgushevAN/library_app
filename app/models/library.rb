class Library < ActiveRecord::Base
  has_many :book_presences, dependent: :destroy
  has_many :books, through: :book_presences

  accepts_nested_attributes_for :book_presences, allow_destroy: true
end
