feature 'Viewing bookmarks index' do
  scenario "visit '/bookmarks' and see a list of bookmark (URLs)" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data:
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://askjeeves.com', 'Ask Jeeves');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")

    visit '/bookmarks'
    expect(page).to have_link 'Makers Academy'
    expect(page).to have_link 'Ask Jeeves'
    expect(page).to have_link 'Google'
  end
end
