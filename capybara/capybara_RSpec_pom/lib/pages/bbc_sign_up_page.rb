require 'capybara/dsl'

class BbcSignUpPage
  include Capybara::DSL

  DAY_INPUT_FIELD_ID = "day-input"
  MONTH_INPUT_FIELD_ID = "month-input"
  YEAR_INPUT_FIELD_ID = "year-input"
  SUBMIT_BUTTON_ID = "submit-button"
  DATE_ERROR_MESSAGE_ID = "form-message-dateOfBirth"
  EMAIL_INPUT_FIELD_ID = "email"
  PASSWORD_INPUT_FIELD_ID = "password"
  POSTCODE_INPUT_FIELD_ID = "postcode"
  GENDER_INPUT_FIELD_ID = "gender-input"
  OPTIN_CHOICE_ID = "#marketingOptIn"
  EMAIL_ERROR_MESSAGE_ID = "form-message-email"
  PASSWORD_ERROR_MESSAGE_ID = "form-message-password"
  POSTCODE_ERROR_MESSAGE_ID = "form-message-postcode"
  GENDER_ERROR_MESSAGE_ID = "form-message-gender"
  OPTIN_ERROR_MESSAGE_ID = "form-message-marketingOptIn"
  REGISTER_BUTTON_ID = "submit-button"

  def input_day(day)
    fill_in(DAY_INPUT_FIELD_ID, with: day)
  end

  def input_month(month)
    fill_in(MONTH_INPUT_FIELD_ID, with: month)
  end

  def input_year(year)
    fill_in(YEAR_INPUT_FIELD_ID, with: year)
  end

  def submit
    click_button(SUBMIT_BUTTON_ID)
  end

  def date_error_text
    find(:id, DATE_ERROR_MESSAGE_ID).text
  end

  def input_email(email)
    fill_in(EMAIL_INPUT_FIELD_ID, with: email)
  end

  def input_password(password)
    fill_in(PASSWORD_INPUT_FIELD_ID, with: password)
  end

  def input_postcode(postcode)
    fill_in(POSTCODE_INPUT_FIELD_ID, with: postcode)
  end

  def select_gender(gender)
    select(gender, from: GENDER_INPUT_FIELD_ID)
  end

  def click_opt(opt)
    find(:xpath, ".//label[@for='#{opt}']/div/div").click
  end

  def email_error_text
    find(:id, EMAIL_ERROR_MESSAGE_ID).text
  end

  def password_error_text
    find(:id, PASSWORD_ERROR_MESSAGE_ID).text
  end

  def postcode_error_text
    find(:id, POSTCODE_ERROR_MESSAGE_ID).text
  end

  def gender_error_text
    find(:id, GENDER_ERROR_MESSAGE_ID).text
  end

  def optin_error_text
    find(:id, OPTIN_ERROR_MESSAGE_ID).text
  end

  def signup_success
    find(:xpath, ".//h1/span").text
  end
end
