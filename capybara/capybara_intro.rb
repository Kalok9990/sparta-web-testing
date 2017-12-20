require 'capybara'

# initiates the driver
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

#new instance of the session
session = Capybara::Session.new(:chrome)

session.visit("http://toolsqa.com/automation-practice-form/")
session.fill_in("firstname", with: "test")
session.fill_in("lastname", with: "test2")
session.choose("sex-0")
session.choose("exp-0")
session.fill_in("datepicker", with: "Todays date")
session.find(:css, "#profession-1").click
session.check("tool-2")
session.select('Europe', from: 'continents')
sleep 3
