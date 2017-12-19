require 'spec_helper'

describe 'Incorrect user details produces valid error' do

  context 'it should respond with the correct error when incorrect details are input' do

    it 'should produce an error when inputting an invalid username' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("kalok")
      @bbc_site.bbc_sign_in_page.fill_in_password("password")
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_username_text).to eq "Sorry, we can’t find an account with that username. If you\'re over 13, try your email address instead or get help here."
    end

    it 'should produce an error when inputting an incorrect email' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("kalok1994@hotmail.co.u")
      @bbc_site.bbc_sign_in_page.fill_in_password("password")
      expect(@bbc_site.bbc_sign_in_page.incorrect_username_text).to eq "Sorry, that doesn't look right. Please check it's a proper email."
    end

    it 'should produce an error when inputting a correct email/username with invalid password' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("kalok1994@hotmail.co.uk")
      @bbc_site.bbc_sign_in_page.fill_in_password("password")
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_password_text).to eq "Uh oh, that password doesn’t match that account. Please try again."
    end

    it 'should produce an error when inputting a correct email/username with empty password' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("kalok1994@hotmail.co.uk")
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page)
      expect(@bbc_site.bbc_sign_in_page.incorrect_password_text).to eq "Something's missing. Please check and try again."
    end
  end

end
