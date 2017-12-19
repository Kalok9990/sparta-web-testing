require 'spec_helper'

describe 'Incorrect details produces valid error' do

  context 'it should respond with the correct error when incorrect details are input' do

    it "should produce an error message when invalid dates are input" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.register_link
      @bbc_site.bbc_sign_up_page.submit
      expect(@bbc_site.bbc_sign_up_page.date_error_text).to eq "Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
    end

    it "should produce error messages when the fields are empty" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.register_link
      @bbc_site.bbc_sign_up_page.input_day("2")
      @bbc_site.bbc_sign_up_page.input_month("10")
      @bbc_site.bbc_sign_up_page.input_year("1995")
      @bbc_site.bbc_sign_up_page.submit
      @bbc_site.bbc_sign_up_page.submit
      expect(@bbc_site.bbc_sign_up_page.email_error_text).to eq "Something's missing. Please check and try again."
      expect(@bbc_site.bbc_sign_up_page.password_error_text).to eq "Something's missing. Please check and try again."
      expect(@bbc_site.bbc_sign_up_page.postcode_error_text).to eq "Something's missing. Please check and try again."
      expect(@bbc_site.bbc_sign_up_page.gender_error_text).to eq "Something's missing. Please check and try again."
      expect(@bbc_site.bbc_sign_up_page.optin_error_text).to eq "Something's missing. Please check and try again."
    end
  end
end
