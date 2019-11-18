# frozen_string_literal: true

describe 'Forms', :forms do
  it 'login com sucesso' do
    visit '/login'
    # Fill fields, fill_in works with name and id propertier on HTML
    fill_in 'userId', with: 'stark'
    fill_in 'password', with: 'jarvis!'
    # submit form
    click_button 'Login'

    expect(find('#flash').visible?).to be true

    expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
  end

  it 'senha incorreta' do
    visit '/login'
    # Fill fields, fill_in works with name and id propertier on HTML
    fill_in 'userId', with: 'stark'
    fill_in 'password', with: 'jarvis#'
    # submit form
    click_button 'Login'

    expect(find('#flash').visible?).to be true

    expect(find('#flash').text).to include 'Senha é invalida!'
  end

  it 'usuário não cadastrado' do
    visit '/login'
    # Fill fields, fill_in works with name and id propertier on HTML
    fill_in 'userId', with: 'smith'
    fill_in 'password', with: 'test!'
    # submit form
    click_button 'Login'

    expect(find('#flash').visible?).to be true

    expect(find('#flash').text).to include 'O usuário informado não está cadastrado!'
  end
end
