# frozen_string_literal: true

describe 'Dynamic Control', :dc do
  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/dynamic_controls'
  end

  it 'quando habilita o campo' do
    # quando existe a propriedade true o campo está desabilitado
    fieldDisabled = page.has_field? 'movie', disabled: true
    expect(fieldDisabled).to be true

    click_button 'Habilita'

    fieldEnabled = page.has_field? 'movie', disabled: false
    expect(fieldEnabled).to be true
    message = find('#message')
    expect(message.text).to eql 'Campo habilitado!'
  end
end
