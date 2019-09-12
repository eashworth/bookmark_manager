require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV'] = 'test'
      conn = PG.connect(dbname: 'bookmark_manager-test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    bookmarks_all_data = conn.exec( "SELECT * FROM bookmarks" )
        bookmarks_all_data.map do |row|
        row['url']
      end
  end
end
