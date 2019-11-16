describe "Forms" do
  it "login com sucesso" do
    visit 'https://training-wheels-protocol.herokuapp.com/login'
    # Fill fields, fill_in works with name and id propertier on HTML
    fill_in 'userId', with: 'stark'
    fill_in 'password', with: 'jarvis!'
    # submit form
    click_button 'Login'

    expect(find('#flash').visible?).to be true
  end
  
end
