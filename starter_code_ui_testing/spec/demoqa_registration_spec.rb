require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq "http://demoqa.com/registration/"
    end

    it 'should accept a first name' do
      @driver.set_first_name_field("Kalok")
      expect(@driver.first_name_field_displayed).to eq true
    end

    it 'should accept a last name' do
      @driver.set_last_name_field("Cheung")
      expect(@driver.last_name_field_displayed).to eq true
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      expect(@driver.select_marital_option("single")).to eq true
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      expect(@driver.select_hobby_option("dance")).to eq true
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country).to eq "Afghanistan"
    end

    it 'accept a new DOB' do
      expect(@driver.dob_month_list_select("10")).to eq true
      expect(@driver.dob_day_list_select("2")).to eq true
      expect(@driver.dob_year_list_select("1994")).to eq true
    end

    it 'should accept a new country value' do
      country = "Canada"
      expect(@driver.country_dropdown_list_select(country)).to eq true
    end

    it 'should accept a valid phone number' do
      no = "07784150556"
      @driver.set_phone_number_field(no)
      expect(@driver.get_phone_number_field_value).to be_kind_of(String).and eq no
    end

    it 'should accept a username' do
      username = "Kalok9990"
      @driver.set_user_name_field(username)
      expect(@driver.get_user_name_field_value).to be_kind_of(String).and eq username
    end

    it "should accept an email" do
      email = "kalok1994@hotmail.co.uk"
      @driver.set_email_field(email)
      expect(@driver.get_email_field_value).to be_kind_of(String).and eq email
    end

    it 'should accept about yourself text' do
      details = "My name is Kalok and I am a trainee at Sparta"
      @driver.set_about_yourself_field(details)
      expect(@driver.get_about_yourself_value).to be_kind_of(String).and eq details
    end

    it 'should accept a password' do
      password = "password"
      @driver.set_password_field(password)
      expect(@driver.get_password_value).to be_kind_of(String).and eq password
    end

    it 'should accept a password confirmation' do
      password = "password"
      @driver.set_confirmation_password_field(password)
      expect(@driver.get_confirmation_password_value).to eq @driver.get_password_value
    end

  end

end
