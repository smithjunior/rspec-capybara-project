describe 'Meu primeiro script' do
  it 'visitar a página' do
    # https://training-wheels-protocol.herokuapp.com
    visit 'https://training-wheels-protocol.herokuapp.com'
    expect(page.title).to eql 'Training Wheels Protocol'
  end
end
