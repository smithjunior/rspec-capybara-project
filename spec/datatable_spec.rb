# frozen_string_literal: true

describe 'Datatables', :datatable do
  before(:each) do
    visit '/tables'
  end

  it 'deve exibir o salario do stark' do
    atores = all('table tbody tr')

    stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr') }

    expect(stark.text).to include '10.000.000'
  end

  it 'deve exibir o salario do vin diesel' do
    diesel = find('table tbody tr', text: '@vindiesel')

    expect(diesel).to have_content '10.000.000'
  end

  it 'deve exibir o filme velozes' do
    diesel = find('table tbody tr', text: '@vindiesel')

    movie = diesel.all('td')[2].text

    expect(diesel).to have_content 'Velozes e Furiosos'
    expect(movie).to eql 'Velozes e Furiosos'
    expect(movie).not_to eql 'Fast and Furious'
  end

  it 'deve exibir o insta do chris evans' do
    evans = find('table tbody tr', text: 'Chris Evans')

    insta = evans.all('td')[4].text

    expect(insta).to eql '@teamcevans'
  end

  it 'deve selecionar chris pratt para remoção' do
    prat = find('table tbody tr', text: 'Chris Pratt')
    prat.find('a', text: 'delete').click

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'

  end

  it 'deve selecionar chris pratt para edição' do
    prat = find('table tbody tr', text: 'Chris Pratt')
    prat.find('a', text: 'edit').click

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'Chris Pratt foi selecionado para edição!'

  end
end
