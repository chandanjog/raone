class Author < ActiveRecord::Base
  has_and_belongs_to_many :books

  def self.names search_value
    find(:all, :conditions => ["name LIKE ?", "%#{search_value}%"] )
  end

end
