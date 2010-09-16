class BooksController < ApplicationController
  attr_reader :books
  
  def index
    @books = Book.find(:all)
    render :layout => "two_column"
  end

  def add
    book_tags = []
    if request.post?
      book_fields = params[:book]
      book_tags << book_fields[:tag_list]
      book_tags << book_fields[:name]
      book_tags << book_fields[:author]
      
      book_fields[:tag_list] = book_tags 
      @book = Book.new(book_fields)
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

  def tags
    tags = ActsAsTaggableOn::Tag.where("name LIKE '%#{params[:q]}%'")
    tag_names = tags.collect{|tag| tag.name}

    render :json => tag_names.compact.join("\n").to_json
  end

  def search
    
  end

end
