# frozen_string_literal: true

describe 'Alerta de JS', :alert do
  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/javascript_alerts'
  end

  it 'alerta' do
    click_button 'Alerta'

    mensagem = page.driver.browser.switch_to.alert.text
    expect(mensagem).to eql 'Isto é uma mensagem de alerta'
  end
  it 'sim confirma' do
    click_button 'Confirma'

    mensagem = page.driver.browser.switch_to.alert.text
    expect(mensagem).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'Mensagem confirmada'
  end

  it 'não confirma' do
    click_button 'Confirma'

    mensagem = page.driver.browser.switch_to.alert.text
    expect(mensagem).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_content 'Mensagem não confirmada'
  end

  it 'accept prompt' do

    accept_prompt(with: 'Fernando') do
      click_button 'Prompt'
    end

    expect(page).to have_content 'Olá, Fernando'
  end

  it 'dismiss prompt' do

    dismiss_confirm do
      click_button 'Prompt'
    end

    expect(page).to have_content 'Olá, null'
  end
end
