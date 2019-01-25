require_relative 'web_helpers'

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors

# - the marketeer will be presented the choices (rock, paper and scissors)
# - the marketeer can choose one option
# - the game will choose a random option
# - a winner will be declared

feature 'user can choose rock, paper, or scissors' do
  scenario 'when loading the play page' do
    enter_name_and_go
    expect(page).to have_content('Choose your move:')
  end

  scenario 'when selecting rock, win' do
    enter_name_and_go
    choose 'rock'
    click_button "Let's play!"
    expect(page).to have_content('Al chose: Rock')
    expect(page).to have_content('Computer chose: Scissors')
    expect(page).to have_content('You win!')
  end

  scenario 'when selecting scissors, lose' do
    enter_name_and_go
    choose 'scissors'
    click_button "Let's play!"
    expect(page).to have_content('Al chose: Scissors')
    expect(page).to have_content('Computer chose: Rock')
    expect(page).to have_content('You lose!')
  end

  scenario 'when selecting paper, draw' do
    enter_name_and_go
    choose 'paper'
    click_button "Let's play!"
    expect(page).to have_content('Al chose: Paper')
    expect(page).to have_content('Computer chose: Paper')
    expect(page).to have_content('Draw!')
  end
end
