Given('estou na pagina de criar um novo cliente') do
  visit '/clientes/new'
  expect(page).to have_current_path('/clients/new')
end

When('eu preencho o nome {string}, a data de nascimento {string}, o cpf {string}, o email {string}') do |nome, dataNascimento, cpf, email|
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[data_de_nascimento]', :with => dataNascimento
  fill_in 'cliente[cpf]', :with => cpf
  fill_in 'cliente[email]', :with => email
  click_button 'Create Cliente'
end

Then('eu vejo que cliente com o cpf {string} foi criado') do |cpf|
  expect(page).to have_content(cpf)
  expect(page).to have_current_path("/clientes/" +  Cliente.last.id.to_s )
end

Then('eu vejo uma mensagem de cpf invalido') do
  expect(page).to have_content("Cpf is the wrong length")
end
