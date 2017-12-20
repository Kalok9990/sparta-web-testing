require 'selenium-webdriver'

# Define a webdriver to use
chrome_driver = Selenium::WebDriver.for :chrome

# Opens up the specefic url
chrome_driver.get "http://toolsqa.com/automation-practice-form/"

# opens the page up for 4 seconds
sleep 4

#finds element with the name "firstname" and return true or false to se if it is displayed
chrome_driver.find_element(:name, "firstname").displayed?

#finds the element and sends the keys to the specific element
chrome_driver.find_element(:name, "firstname").send_keys("Kalok")
chrome_driver.find_element(:name, "lastname").displayed?
chrome_driver.find_element(:name, "lastname").send_keys("Cheung")

sleep 4
