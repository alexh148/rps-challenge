require_relative 'web_helpers'

# As a marketeer
# So that I can see my name in lights
# I would like to register my name before playing an online game

feature 'registers the users name' do
  scenario 'when the page is first loaded' do
    enter_name_and_go
    expect(page).to have_content('Welcome, Al!')
  end
end
