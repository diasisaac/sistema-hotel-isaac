Given ('estou na pagina de clientes') do
  visit '/clientes'
  expect(page).to have_current_path('/clientes')
end
And('o cliente com o nome {string}, a data de nascimento {string}, o cpf {string}, o email {string} existe') do |nome, dataNascimento, cpf, email|
  visit '/clientes/new'
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[data_de_nascimento]', :with => dataNascimento
  fill_in 'cliente[cpf]', :with => cpf
  fill_in 'cliente[email]', :with => email
  click_button 'Create Cliente'
end
Given('estou na pagina de criar um novo cliente') do
  visit '/clientes/new'
  expect(page).to have_current_path('/clientes/new')
end

When('eu preencho o nome {string}, a data de nascimento {string}, o cpf {string}, o email {string}') do |nome, dataNascimento, cpf, email|
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[data_de_nascimento]', :with => dataNascimento
  fill_in 'cliente[cpf]', :with => cpf
  fill_in 'cliente[email]', :with => email
  click_button 'Create Cliente'
end

When('clico em deletar cliete') do
  click_button 'Destroy this cliente'
end

Then('eu vejo que o cliente foi deletado') do
  expect(page).to have_content("Cliente was successfully destroyed")
end

Then('eu vejo uma mensagem de email invalido') do
  expect(page).to have_content("Tamanho minimo 5 caracteres")
end

When('eu edito com o nome {string}, a data de nascimento {string}, o cpf {string}, o email {string}') do |nome, dataNascimento, cpf, email|
  click_link 'Edit this cliente'
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[data_de_nascimento]', :with => dataNascimento
  fill_in 'cliente[cpf]', :with => cpf
  fill_in 'cliente[email]', :with => email
  click_button 'Update Cliente'
end

Then('eu vejo uma mensagem de cliente editado com sucesso') do
  expect(page).to have_content("Cliente was successfully updated")
end


Then('eu vejo que cliente com o cpf {string} foi criado') do |cpf|
  expect(page).to have_content(cpf)
  expect(page).to have_current_path("/clientes/" +  Cliente.last.id.to_s )
end

Then('eu vejo uma mensagem de cpf invalido') do
  expect(page).to have_content("Cpf is the wrong length")
end
