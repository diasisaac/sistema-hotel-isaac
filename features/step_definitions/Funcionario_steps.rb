

Then('eu vejo que funcionario com o email {string} foi criado') do |string|
  expect(page).to have_content("Minha Conta")
end

Given('existe um funcionario cadastrado com o nome {string} o sobrenome {string}, a data de nascimento {string}, o cpf {string}, o email {string}, o tipo {string}, a senha {string}  e a confirmação {string}') do |string, string2, string3, string4, string5, string6, string7, string8|
  visit '/users/sign_up'
  fill_in 'First Name', with: string
  fill_in 'Last Name', with: string2
  fill_in 'CPF', with: string3
  fill_in 'XXX.XXX.XXX-XX', with: string4
  fill_in 'Email address', with: string5
  select string6, :from => "user[role]"
  fill_in 'Password', with: string7
  fill_in 'Password_confirmation', with: string8
  click_button 'Cadastrar'
end


Then('eu vejo uma mensagem de funcionaio editado com sucesso') do
  expect(page).to have_content("successfully")
end

Then('Then eu vejo uma mensagem de cpf invalido') do
  expect(page).to have_content("Cpf is the wrong length")
end


Given('estou na pagina de editar funcionario') do
  visit '/users/edit'
  expect(page).to have_current_path('/users/edit')
end

