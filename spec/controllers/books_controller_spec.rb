require '../spec_helper'

describe BooksController do

  it "should use BooksController" do
    controller.should be_an_instance_of(BooksController)
  end

  it "GET 'add' should render add" do
    get 'add'
    response.should render_template :add
  end

  it "add should save a book on POST with all the parameters" do
    params = {:book => {"name" =>'abc', "mrp" =>"23.45"}}
    book = mock('book')
    Book.should_receive(:new).with(params[:book]).and_return(book)
    book.should_receive(:save!).and_return(book)

    post :add , params
  end

  it "add should redirect to index on POST" do
    book=mock("book")
    Book.should_receive(:new).and_return(book)
    book.should_receive(:save!).and_return(book)
    
    post :add
    response.should redirect_to :controller =>'books',:action=>'index'
  end

  it "should route to add action" do
    get :add
  end  
end
