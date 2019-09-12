require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data:
      Bookmark.add_new_bookmark('http://www.makersacademy.com')
      Bookmark.add_new_bookmark('http://askjeeves.com')
      Bookmark.add_new_bookmark('http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://askjeeves.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.add_new_bookmark' do
    it 'adds a new url' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.add_new_bookmark('https://www.bbc.co.uk')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('https://www.bbc.co.uk')
    end
  end
end
