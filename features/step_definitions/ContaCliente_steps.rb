Given('estou na pagina de cadastrar uma conta') do
  visit '/users/sign_up'
  expect(page).to have_current_path('/users/sign_up')
end


When('eu preencho o nome {string} o sobrenome {string}, a data de nascimento {string}, o cpf {string},o tipo {string}, o email {string}, a senha {string}  e a confirmacao {string}') do
|nome, string2, string3, string4, tipo, string6, string7, string8|
  fill_in 'First Name', with: nome
  fill_in 'Last Name', with: string2
  fill_in 'CPF', with: string3
  fill_in 'XXX.XXX.XXX-XX', with: string4
  select tipo, :from => "user[role]"
  fill_in 'Email address', with: string6
  fill_in 'Password', with: string7
  fill_in 'Password_confirmation', with: string8
  click_button 'Cadastrar'
end


Then('eu vejo que minha conta foi criada') do
  expect(page).to have_content("Minha Conta")
end
Given('existe um clinte cadastrado com o nome {string} o sobrenome {string}, a data de nascimento {string}, o cpf {string},o tipo {string}, o email {string}, a senha {string}  e a confirmação {string}') do |string, string2, string3, string4,tipo, string5, string7, string8|
  visit '/users/sign_up'
  fill_in 'First Name', with: string
  fill_in 'Last Name', with: string2
  fill_in 'CPF', with: string3
  fill_in 'XXX.XXX.XXX-XX', with: string4
  select tipo, :from => "user[role]"
  fill_in 'Email address', with: string5
  fill_in 'Password', with: string7
  fill_in 'Password_confirmation', with: string8
  click_button 'Cadastrar'
end



Given('eu estou logado no sistema com a conta com email {string} e senha {string}') do |string, string2|
  click_button 'Sign out'
  visit '/users/sign_in'
  fill_in 'Email address', with: string
  fill_in 'Password', with: string2
  click_button 'Sign in'
end

Given('estou na pagina de editar cliente') do
  visit '/users/edit'
  expect(page).to have_current_path('/users/edit')
end

When('eu coloco a nova senha {string}, a confirmação {string} e a senha atual {string}') do | string7, string8, string9|
  visit '/users/edit'
  fill_in 'Password', :with => string7
  fill_in 'Password_confirmation', with: string8
  fill_in 'Password_atual', with: string9
  click_button 'Atualizar'
end

Then('eu vejo uma mensagem de cliente editado com sucesso') do
  expect(page).to have_content("successfully")
end

Then('eu vejo uma mensagem de cpf invalido') do
  expect(page).to have_content("Cpf is the wrong length")
end

When('eu clico em cancelar conta') do
  click_button 'Apagar Conta'
end

Then('eu vejo que minha conta com o email {string} e senha {string} foi deletada') do |string,string2|
  visit '/users/sign_in'
  fill_in 'Email address', with: string
  fill_in 'Password', with: string2
  click_button 'Sign in'
  expect(page).to have_content("Invalid Email or password.")
end

Then('eu vejo uma mensagem sobre email invalido') do
  expect(page).to have_content("Email can't be blank")
end
