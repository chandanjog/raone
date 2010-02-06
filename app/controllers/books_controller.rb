class BooksController < ApplicationController

  def index
  end

  def show
  end
  
  def add
    render if request.get?
    if request.post?
      @book = Book.new(params[:book]).save!
      redirect_to :controller=>'books' 
    end
  end
end
