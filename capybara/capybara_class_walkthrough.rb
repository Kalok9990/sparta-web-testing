require 'capybara/dsl'

class BbcHomepage

  HOMEPAGE_URL = "https://www.bbc.co.uk/"
  SIGN_IN_LINK_ID = "idcta-link"
  USERNAME_INPUT_FIELD = "username"
  PASSWORD_INPUT_FIELD = "password"
  SUBMIT_BUTTON = "Sign in"

  def initialize
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end

    @driver = Capybara::Session.new(:chrome)
  end

  def visit_homepage
    @driver.visit(HOMEPAGE_URL)
  end

  def go_to_sign_in
    @driver.click_link(SIGN_IN_LINK_ID)
  end

  def fill_in_username
    @driver.fill_in(USERNAME_INPUT_FIELD, with: "kalok1994@hotmail.co.uk")
  end

  def fill_in_password
    @driver.fill_in(PASSWORD_INPUT_FIELD, with: "Resistance941")
  end

  def sign_in
    @driver.click_button(SUBMIT_BUTTON)
  end

  def go_to_news
    @driver.click_link("News")
  end
end

test1 = BbcHomepage.new
test1.visit_homepage
test1.go_to_sign_in
test1.fill_in_username
test1.fill_in_password
test1.sign_in
