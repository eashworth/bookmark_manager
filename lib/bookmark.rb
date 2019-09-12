require 'pg'

class Bookmark
  def self.all
    conn = self.connect
    bookmarks_all_data = conn.exec( "SELECT * FROM bookmarks" )
    bookmarks_all_data.map do |row|
      row['url']
    end
  end

  def self.add_new_bookmark(url)
    conn = self.connect
    conn.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

  private_class_method

  def self.connect
    return PG.connect(dbname: 'bookmark_manager_test') if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'bookmark_manager')
  end
end
