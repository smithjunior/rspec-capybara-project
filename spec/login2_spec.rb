# frozen_string_literal: true

describe 'Login 2', :login do
  before(:each) do
    visit '/login2'
  end
  it 'login com sucesso' do
    # Fill fields, fill_in works with name and id propertier on HTML
    find('#userId').set 'stark'
    find('#passId').set 'jarvis!'

    login_form = find('#login')
    case login_form.text
    when /Dia/
      find('#day').set '29'
    when /Mês/
      find('#month').set '05'
    when /Ano/
      find('#year').set '1970'
    end

    # submit form
    click_button 'Login'

    expect(find('#flash').visible?).to be true
    expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
  end
end
