# User story:

# As a user,
# so that I can re-visit my favourite bookmarks,
# I want to be able to add new bookmarks to the list

feature 'Adding a bookmark' do
  scenario 'Input and store a bookmark' do
    visit '/bookmarks'
    click_button 'Add new bookmark'
    fill_in 'New bookmark', with: 'https://www.bbc.co.uk'
    click_button 'Confirm'
    expect(page).to have_content('https://www.bbc.co.uk')
  end
end
