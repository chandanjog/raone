require File.expand_path(File.dirname(__FILE__)+'/../spec_helper')

describe BooksController do

  it "should use BooksController" do
    controller.should be_an_instance_of(BooksController)
  end

  it "add should render the view on GET" do
    get 'add'
    response.should render_template :add
  end

  it "add should save a book on AJAX POST with all the parameters and return the book id" do
    book = mock('book')
    Book.should_receive(:new).and_return(book)
    book.should_receive(:save!).and_return(book)
    book.stub(:id).and_return(1)

    xhr :post , :add
    
    response.should render_template "books/_posted_book"
  end

#  it "update should save the updated book fields on AJAX POST" do
#    book = mock(Book)
#    Book.should_receive(:update).and_return(book)
#
#    xhr :post, :update
#    response.should render_template "books/update"
#  end
#
#  it "update should delete the book on AJAX POST" do
#    Book.should_receive(:delete)
#
#    xhr :post, :delete
#  end

  it "get index should list all the books " do
    books = [Book.new, Book.new]
    Book.should_receive(:find).with(:all).and_return(books)

    get :index

    controller.books.size.should == 2
  end

  describe "routes" do
    it "should route to add action" do
    end
  end
end
