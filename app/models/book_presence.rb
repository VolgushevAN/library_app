class BookPresence < ActiveRecord::Base
  belongs_to :library
  belongs_to :book

  scope :available, ->  { where('book_presences.on_hands < book_presences.count') }

  def availabe_count
    count - on_hands
  end
end
