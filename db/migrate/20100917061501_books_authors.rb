class BooksAuthors < ActiveRecord::Migration
  def self.up
    create_table :books_authors do |t|
      t.integer :book_id
      t.integer :author_id
      t.timestamps
    end
  end

  def self.down
    drop_table :books_authors
  end
end
