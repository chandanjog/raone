require File.expand_path(File.dirname(__FILE__)+'/../spec_helper')

describe BooksController do

  it "should use BooksController" do
    controller.should be_an_instance_of(BooksController)
  end

  it "add should render the view on GET" do
    get 'add'
    response.should render_template :add
  end

  it "add should save a book on POST with all the parameters and return the book id" do
    book = mock('book')
    Book.should_receive(:new).and_return(book)
    book.should_receive(:save!).and_return(book)
    book.stub(:id).and_return(1)

    post :add
    
    response.should redirect_to :action => :index
  end

  it "add should save the book title and author as tags on POST with all the parameters" do
    book = mock('book')
    Book.stub(:new).with("mrp"=>"97", "name"=>"hey baby", "author"=>"xyz", "tag_list"=>["987987","hey baby","xyz"], "sale_price"=>"987").and_return(book)
    book.stub(:save!).and_return(book)
    book.stub(:id).and_return(1)

    post :add, "book"=>{"mrp"=>"97", "name"=>"hey baby", "author"=>"xyz", "tag_list"=>"987987", "sale_price"=>"987"} 
  end

  it "should save the updated book fields on POST" do
    Book.should_receive(:update)

    post :update
    response.should redirect_to :action => :index
  end

  it "should delete the book on GET" do
    Book.should_receive(:delete)

    get :delete
    response.should redirect_to :action => :index
  end

  it "get index should list all the books " do
    books = [Book.new, Book.new]
    Book.should_receive(:find).with(:all).and_return(books)

    get :index

    controller.books.size.should == 2
  end

  it "AJAX GET on tags should list all the tags for books" do
    tags=[ActsAsTaggableOn::Tag.new(:name=>"te"),ActsAsTaggableOn::Tag.new(:name=>"tom"),ActsAsTaggableOn::Tag.new(:name=>"kate")]
    ActsAsTaggableOn::Tag.should_receive(:where).with("name LIKE '%t%'").and_return(tags)
    controller.should_receive(:render).with(:json => { :tags => ["te","tom","kate"]}.to_json)

    xhr :get , :tags , :search_tags_on => 't'
  end

  describe "routes" do
    it "should route to add action" do
    end
  end
end
