# this test show you how to use scroll and locate element by xpath
# it open the system settings ui, and click the 'About phone' item to find android version
# create by testerhome.com
# author: seveniruby
#
# run using:
# bundle exec ruby xunit_android.rb

require 'rubygems'
require 'test/unit'
require 'appium_lib'

class FirstTest < Test::Unit::TestCase
  def setup
    puts 'preparam'
    puts ARGV[1]
    puts 'postparam'
    caps   = { caps:       { platformName: 'Android',
                             deviceName: 'Nexus 7',
                             appActivity: '.MainActivity',
                             appPackage: 'com.example.julianlo.placedsdkplayground'
                            },
               appium_lib: { sauce_username: nil,
                             sauce_access_key: nil } }
    driver = Appium::Driver.new(caps)
    Appium.promote_appium_methods self.class
    driver.start_driver.manage.timeouts.implicit_wait = 20 # seconds
  end

  def teardown
    driver_quit
  end

  def test_about_phone_version

    # Intro activity
    xpath('//android.widget.TextView[@text="Skip"]').click
    sleep(1) # seems to be necessary
    xpath('//android.widget.TextView[@text="Accept"]').click
    button('Allow').click

    # Opening activity
    xpath('//android.widget.Button[@text="Sign In With Email"]').click

    # Login activity
    emailEdit = xpath('//android.widget.EditText[1]')
    emailEdit.send_keys('constancechong.8@gmail.com')
    passwordEdit = xpath('//android.widget.EditText[@password="true"]')
    passwordEdit.send_keys('test1234')
    button('Login').click
    sleep(1)

    # Mileage plan activity
    xpath('//android.widget.ImageView[@content-desc="More options"]').click
    xpath('//android.widget.TextView[@text="Logout"]').click
    button('OK').click
    sleep(2)
  end
end
