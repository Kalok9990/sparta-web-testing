require 'spec_helper'

describe 'Correct details input' do

  context 'it should correctly signup when correct details are input' do

    before(:each) do
      @bbc_site = BbcSite.new
      @home = @bbc_site.bbc_homepage
      @signin = @bbc_site.bbc_sign_in_page
      @signup = @bbc_site.bbc_sign_up_page
    end

    after(:all)do
      Capybara.current_session.driver.quit
    end

    it "should signup successfully" do
      @home.visit_home_page
      @home.click_sign_in_link
      @signin.click_register_link
      @signup.input_day("2")
      @signup.input_month("2")
      @signup.input_year("1992")
      @signup.submit
      @signup.input_email("kalok38045@gmail.com")
      @signup.input_password("kalok941")
      @signup.input_postcode("SL6 2BL")
      @signup.select_gender("Male")
      @signup.click_opt("optOut")
      @signup.submit

      sleep 5
      expect(@signup.signup_success).to eq "Thanks. You're now signed in."
      sleep 3
    end
  end
end
