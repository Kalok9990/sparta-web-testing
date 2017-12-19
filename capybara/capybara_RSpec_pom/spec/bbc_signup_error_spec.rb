require 'spec_helper'

describe 'Incorrect details produces valid error' do

  context 'it should respond with the correct error when incorrect details are input' do

    before(:each) do
      @bbc_site = BbcSite.new
      @homepage = @bbc_site.bbc_homepage
      @signin = @bbc_site.bbc_sign_in_page
      @signup = @bbc_site.bbc_sign_up_page
      @homepage.visit_home_page
      @homepage.click_sign_in_link
    end

    after(:each) do
      Capybara.current_session.driver.quit
    end

    it "should produce an error message when invalid dates are input" do
      @signin.click_register_link
      @signup.submit
      expect(@signup.date_error_text).to eq "Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
    end

    it "should produce error messages when the fields are empty" do
      @signin.click_register_link
      @signup.input_day("2")
      @signup.input_month("10")
      @signup.input_year("1995")
      @signup.submit
      @signup.register
      expect(@signup.email_error_text).to eq "Something's missing. Please check and try again."
      expect(@signup.password_error_text).to eq "Something's missing. Please check and try again."
      expect(@signup.postcode_error_text).to eq "Something's missing. Please check and try again."
      expect(@signup.gender_error_text).to eq "Something's missing. Please check and try again."
      expect(@signup.optin_error_text).to eq "Something's missing. Please check and try again."
    end
  end
end
