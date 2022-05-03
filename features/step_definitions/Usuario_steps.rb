Given('estou na pagina de criar conta') do
  visit '/usuarios/sign_up'
  expect(page).to have_current_path('/usuarios/sign_up')
end

When('eu preencho o email {string}, a senha {string} e a confirmação de senha {string}') do |string, string2, string3|
  fill_in 'usuario[email]', :with => string
  fill_in 'usuario[password]', :with => string2
  fill_in 'usuario[password_confirmation]', :with => string3
  click_button 'Sign up'
end

Then('eu vejo que a conta foi criada com sucesso') do
  expect(page).to have_content("Welcome! You have signed up successfully.")
end

Then('eu vejo uma mensagem de senha invalida') do
  expect(page).to have_content("1 error prohibited this usuario from being saved")
end


Given('a conta com o email {string} e a senha {string} exite') do |string, string2|
  visit '/usuarios/sign_up'
  fill_in 'usuario[email]', :with => string
  fill_in 'usuario[password]', :with => string2
  fill_in 'usuario[password_confirmation]', :with => string2
  click_button 'Sign up'
  click_button 'Sign out'
end


Then('eu vejo uma mensagem de email invalido') do
  expect(page).to have_content("Email can't be blank")
end
Then('eu vejo uma mensagem de erro') do
  expect(page).to have_content("Email can't be blank")
end
