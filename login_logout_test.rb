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
                             app: './app-debug.apk'
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

    screenshot 'myscreenshot.jpg'

    # Intro activity
    scroll_to('Button 1').click

  end
end
