# Sparta-Web-Testing - UI Testing

## About the Repository

There are two folders, one where Selenium was used to test the User Interface (UI) and the other where Capybara was used.

For more information on each folder, go into the folder and there are more README documents within.

All these files require the gem rspec.

## Documents

See following documents for more information on the following tools.

1. Selenium
  - https://gist.github.com/huangzhichong/3284966
  - http://www.rubydoc.info/gems/selenium-webdriver/3.8.0
2. Capybara
  - http://www.rubydoc.info/github/jnicklas/capybara
  - https://gist.github.com/zhengjia/428105
  - https://github.com/teamcapybara/capybara

## Run the tests

To run the tests, in the terminal, make sure are in the folder that you want to test, with the folder 'spec' in, and then enter the command.
```
rspec
```

This will automatically run the tests that have been defined in that folder.

## How to add tests

In the spec folder, you will see all the files that contain the tests. To make a new file, you will need to make sure that there is spec in the file name (ie 'name_spec.rb'). In the file you will need to require spec_helper and below is a general format of how the tests are made.

```Ruby
require 'spec_helper'

describe Name_of_Application do

  context 'Description of what you are trying to test' do

    it "description of what the test is for" do

    end
  end
end
```

The `it` block is where the majority of test code is written in. you can have as many `it` blocks as you want, where each one runs a different test.
