class BooksController < ApplicationController
  attr_reader :books
  
  def index
    @books = Book.find(:all)
  end

  def add
    render if request.get?
    if request.xhr?
      @book = Book.new(params[:book])
      @book.save!
      render :partial=> 'posted_book', :locals => {:book => @book}
    end
  end

#  def update
#    if request.get?
#      book = Book.update(params[:id],params[:book])
#      render :partial=> "posted_book", :locals => {:book => book}
#    end
#  end
#
#  def delete
#    if request.get?
#      Book.delete(params[:id])
#      render :json=>{},:status=>200
#    end
#  end
  
end
