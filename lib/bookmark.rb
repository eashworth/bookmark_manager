require 'pg'

class Bookmark
attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    conn = self.connect
    bookmarks_all_data = conn.exec( "SELECT * FROM bookmarks" )
    bookmarks_all_data.map do |row|
      Bookmark.new(row['id'], row['url'], row['title'])
    end
  end

  def self.add_new_bookmark(url:, title:)
    conn = self.connect
    result = conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end

  private_class_method

  def self.connect
    return PG.connect(dbname: 'bookmark_manager_test') if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'bookmark_manager')
  end
end
