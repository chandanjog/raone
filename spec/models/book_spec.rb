require File.expand_path(File.dirname(__FILE__)+'/../spec_helper')

describe Book do
  before(:each) do
    @valid_attributes = {
            :name => "c",
            :author => "K and R",
            :mrp => 23.4,
            :sale_price => 10.00
    }
  end

  it "should create a new instance given valid attributes" do
    Book.create!(@valid_attributes).should be_valid
    end

  it "should have a name" do
    @valid_attributes.delete :name
    book = Book.new(@valid_attributes)
    book.should_not be_valid
    book.errors[:name].should eql("required")
  end

  it "should have mrp in decimal with two places precision if mrp is provided" do
    @valid_attributes[:mrp] = "mrp"
    book = Book.new @valid_attributes
    book.should_not be_valid
    book.errors[:mrp].should eql('required a decimal value with 2 place precision')
  end
end
