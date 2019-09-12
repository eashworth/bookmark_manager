feature 'Viewing bookmarks index' do
  scenario "visit '/bookmarks' and see a list of bookmark (URLs)" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data:
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://askjeeves.com');")
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://askjeeves.com');")

    visit '/bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://askjeeves.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
