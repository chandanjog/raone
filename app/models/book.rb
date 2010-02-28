class Book < ActiveRecord::Base
  validates_presence_of :name, :message =>'required'
end
