class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def new
    @book_presence = BookPresence.find(params[:book_presence_id])
    @book = @book_presence.book
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build reservation_params
    if @reservation.save
      redirect_to root_path, notice: 'Your reservation has been created'
    else
      redirect_to new_reservation_path(book_presence_id: params[:book_presence_id])
    end
  end

  def destroy
    reservation = current_user.reservations.find(params[:id])
    deleted = reservation.destroy if reservation.reserved?
    if deleted
      redirect_to reservations_path, notice: 'Reservation canceled'
    else
      redirect_to reservations_path, alert: 'Error'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :book_presence_id)
  end
end