class BooksController < ApplicationController
  before_action :apply_ransack, only: :index

  def index
    @books = @q.result.limit(10)
  end

  def show
    @book = Book.find params[:id]
  end

  private

  def apply_ransack
    words_for_search = params[:q][:title_or_description_or_author_cont_any].try(:split) if params[:q]
    @q = Book.ransack(title_or_description_or_author_cont_any: words_for_search)
  end
end