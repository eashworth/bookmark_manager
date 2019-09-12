require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data:
      Bookmark.add_new_bookmark('http://www.makersacademy.com', 'Makers Academy')
      Bookmark.add_new_bookmark('http://askjeeves.com', 'Ask Jeeves')
      Bookmark.add_new_bookmark('http://www.google.com', 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.url).to eq('http://www.makersacademy.com')
      expect(bookmarks.first.title).to eq('Makers Academy')
    end
  end

  describe '.add_new_bookmark' do
    it 'adds a new url' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.add_new_bookmark('https://www.bbc.co.uk', 'BBC')
      bookmarks = Bookmark.all
      expect(bookmarks).to include(bookmark)
    end
  end
end
