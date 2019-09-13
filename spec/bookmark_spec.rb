require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      #Add the test data:

      Bookmark.add_new_bookmark(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.add_new_bookmark(url: 'http://askjeeves.com', title: 'Ask Jeeves')
      Bookmark.add_new_bookmark(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.url).to eq('http://www.makersacademy.com')
      expect(bookmarks.first.title).to eq('Makers Academy')
    end
  end

  describe '.add_new_bookmark' do
    it 'adds a new url' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.add_new_bookmark(url: 'https://www.bbc.co.uk', title: 'BBC')
      id = bookmark.id
      result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
      expect(bookmark.id).to eq(result.first['id'])
      expect(bookmark.url).to eq('https://www.bbc.co.uk')
      expect(bookmark.title).to eq('BBC')
    end
  end
end
