require 'spec_helper'

describe 'Correct user details produces valid error' do

  context 'it should correctly login when correct details are input' do

    after(:all) do
      Capybara.current_session.driver.quit
    end

    it "should login successfully" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("kalok1994@hotmail.co.uk")
      @bbc_site.bbc_sign_in_page.fill_in_password("Resistance941")
      @bbc_site.bbc_sign_in_page.click_sign_in_button
    end
  end
end
