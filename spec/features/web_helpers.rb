def enter_name_and_go
  visit '/'
  fill_in 'name', with: 'Al'
  click_button 'Go!'
end
