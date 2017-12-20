require 'spec_helper'

describe 'Incorrect user details produces valid error' do

  context 'it should respond with the correct error when incorrect details are input' do

    before(:each) do
      @bbc_site = BbcSite.new
      @homepage = @bbc_site.bbc_homepage
      @signin = @bbc_site.bbc_sign_in_page
      @homepage.visit_home_page
      @homepage.click_sign_in_link
    end

    after(:all) do
      Capybara.current_session.driver.quit
    end

    it 'should produce an error when inputting an invalid username' do
      @signin.fill_in_username("kalok")
      @signin.fill_in_password("password")
      @signin.click_sign_in_button
      expect(@signin.incorrect_username_text).to eq "Sorry, we can’t find an account with that username. If you\'re over 13, try your email address instead or get help here."
    end

    it 'should produce an error when inputting an incorrect email' do
      @signin.fill_in_username("kalok1994@hotmail.co.u")
      @signin.fill_in_password("password")
      expect(@signin.incorrect_username_text).to eq "Sorry, that doesn't look right. Please check it's a proper email."
    end

    it 'should produce an error when inputting a correct email/username with invalid password' do
      @signin.fill_in_username("kalok1994@hotmail.co.uk")
      @signin.fill_in_password("password")
      @signin.click_sign_in_button
      expect(@signin.incorrect_password_text).to eq "Uh oh, that password doesn’t match that account. Please try again."
    end

    it 'should produce an error when inputting a correct email/username with empty password' do
      @signin.fill_in_username("kalok1994@hotmail.co.uk")
      @signin.click_sign_in_button
      expect(@signin.incorrect_password_text).to eq "Something's missing. Please check and try again."
    end
  end
end
