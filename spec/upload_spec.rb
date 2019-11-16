# frozen_string_literal: true

describe 'Upload', :upload do
  before(:each) do
    @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
    @imagem = Dir.pwd + '/spec/fixtures/imagem.png'

    visit 'https://training-wheels-protocol.herokuapp.com/upload'
  end

  it 'upload com arquivo texto' do
    attach_file('file-upload', @arquivo)
    click_button 'Upload'

    div_arquivo = find('#uploaded-file')
    expect(div_arquivo.text).to include 'arquivo.txt'
  end

  it 'upload de imagem', :upload_imagem do
    attach_file('file-upload', @imagem)
    click_button 'Upload'

    div_arquivo = find('#uploaded-file')
    expect(div_arquivo.text).to include 'imagem.png'

    img = find('#new-image')
    expect(img[:src]).to include 'imagem.png'
  end

end
