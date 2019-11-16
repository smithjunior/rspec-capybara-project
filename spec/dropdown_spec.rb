# frozen_string_literal: true

describe 'Caixa de opções', :dropdown do
  it 'item especifico simples ' do
    visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
    select('Loki', from: 'dropdown')
    sleep 2 # tempoarário
  end

  it 'item especifico com o find' do
    visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
    drop = find('.avenger-list')
    drop.find('option', text: 'Scott Lang').select_option
    sleep 2 # tempoarário
  end

  it 'qualquer item' do
    visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
    drop = find('.avenger-list')
    drop.all('option').sample.select_option
    sleep 2 # tempoarário
  end
end
