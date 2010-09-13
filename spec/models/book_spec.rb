require 'spec_helper'

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

  it "should fetch all the tags associated with books" do
    books = []
    books << Book.new(:name => "Couching tiger", :author => "K and R",:mrp => 23.4,:sale_price => 10.00,:tag_list=>'pune-university te mechanical engineering')
    books << Book.new(:name => "Bloody mary", :author => "K and R",:mrp => 23.4,:sale_price => 10.00,:tag_list=>'indore-university te mechanical engineering')
    books << Book.new(:name => "Priceless", :author => "K and R",:mrp => 23.4,:sale_price => 10.00,:tag_list=>'delhi-university te mechanical engineering')
    books << Book.new(:name => "Zen", :author => "K and R",:mrp => 23.4,:sale_price => 10.00,:tag_list=>'pune-university te mechanical engineering')
    books << Book.new(:name => "Ferari", :author => "K and R",:mrp => 23.4,:sale_price => 10.00,:tag_list=>'pune-university te mechanical engineering')

    books.each do |book|
      book.save!
    end
#    p Book.tagged_with("p")
     p ActsAsTaggableOn::Tag.where("name LIKE '%te%'")
     ActsAsTaggableOn::Tag.where("name LIKE '%te%'").length.should == 3

  end

end
