ActiveAdmin.register Reservation do
  permit_params :date, :book_presence_id, :user_id, :state
end
