class Book < ActiveRecord::Base
  validates_presence_of :name, :message =>'required'
  acts_as_taggable
end
