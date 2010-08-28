class BooksController < ApplicationController
  attr_reader :books
  
  def index
    @books = Book.find(:all)
  end

  def add
    if request.post?
      @book = Book.new(params[:book])
      @book.save!
      redirect_to :action => 'index'
    end
  end

  def update
    if request.post?
      Book.update(params[:id],params[:book])
      redirect_to :action => 'index'
    end
  end

  def delete
    if request.get?
      Book.delete(params[:id])
      redirect_to :action => 'index'
    end
  end
  
end
