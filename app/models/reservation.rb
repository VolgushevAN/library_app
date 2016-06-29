class Reservation < ActiveRecord::Base
  belongs_to :book_presence
  belongs_to :user

  enum state: [:reserved, :on_hands, :returned]

  after_save :update_book_on_hands_count, if: :state_changed?

  def update_book_on_hands_count
    book_presence.update(on_hands: book_presence.on_hands + 1) if on_hands?
    book_presence.update(on_hands: book_presence.on_hands - 1) if returned?
  end
end
