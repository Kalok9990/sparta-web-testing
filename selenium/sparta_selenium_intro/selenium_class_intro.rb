require "selenium-webdriver"

class SeleniumQatoolsForm

  PRACTICE_FORM_URL = "http://toolsqa.com/automation-practice-form/"
  FIRST_NAME_FIELD_NAME = "firstname"
  LAST_NAME_FIELD_NAME = "lastname"
  SEX_RADIO = "sex-0"
  YRS_OF_EXP = "exp-0"
  DATE = "datepicker"
  PROFESSION = "profession-1"
  TOOL = "tool-2"
  CONTINENTS = "continents"
  COMMANDS = "selenium_commands"

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def visit_practice_form
    @chrome_driver.get(PRACTICE_FORM_URL)
  end

  def sleepy
    sleep 1
  end

  def input_first_name(text)
    @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).send_keys(text)
  end

  def input_last_name(text)
    @chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME).send_keys(text)
  end

  def input_sex
    @chrome_driver.find_element(:id, SEX_RADIO).click
  end

  def input_yrs
    @chrome_driver.find_element(:id, YRS_OF_EXP).click
  end

  def input_date(date)
    @chrome_driver.find_element(:id, DATE).send_keys(date)
  end

  def input_prof
    @chrome_driver.find_element(:id, PROFESSION).click
  end

  def input_tool
    @chrome_driver.find_element(:id, TOOL).click
  end

  def choose_continent(continent)
    select = @chrome_driver.find_element(:id, CONTINENTS).click
    all_options = @chrome_driver.find_elements(:tag_name, "option")
    all_options.each do |option|
      if option.text == continent
        option.click
      end
    end
  end

  def get_commands(command)
    all_options = @chrome_driver.find_elements(:tag_name, "option")
    all_options.each do |option|
      if option.text == command
        option.click
      end
    end
  end

  def get_first_name_text
    puts @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME)["value"]
  end
end

x = SeleniumQatoolsForm.new
x.visit_practice_form
x.sleepy
x.input_first_name("Kalok")
x.sleepy
x.input_last_name("Cheung")
x.sleepy
x.input_sex
x.sleepy
x.input_yrs
x.sleepy
x.input_date("18/12/17")
x.sleepy
x.input_prof
x.sleepy
x.input_tool
x.sleepy
x.choose_continent("Europe")
x.sleepy
x.get_commands("Wait Commands")
x.sleepy
x.get_first_name_text
