# User story:

# As a user,
# so that I can re-visit my favourite bookmarks,
# I want to be able to add new bookmarks to the list

feature 'Adding a bookmark' do
  scenario 'Input and store a bookmark' do
    visit '/bookmarks'
    click_button 'Add new bookmark'
    fill_in 'url', with: 'https://www.bbc.co.uk'
    fill_in 'title', with: 'BBC'
    click_button 'Confirm'
    expect(page).to include_link('BBC', href: 'https://www.bbc.co.uk')
  end
end
