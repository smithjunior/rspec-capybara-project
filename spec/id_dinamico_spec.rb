# frozen_string_literal: true

describe 'IDs Dinamicos', :dynamic_ids do
  before(:each) do
    visit '/access'
  end

  it 'cadastro' do
    find('input[id$=UsernameInput]').set 'smith'
    find('input[id^=PasswordInput]').set '123456'
    find('a[id*=GetStartedButton]').click

    expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
  end
end
