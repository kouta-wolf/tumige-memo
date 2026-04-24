require 'socket'

Capybara.register_driver :remote_chrome do |app|
  if ENV['CI'].present?
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  else
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1680,1050')
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: ENV.fetch('SELENIUM_DRIVER_URL', 'http://selenium:4444/wd/hub'),
      capabilities: options
    )
  end
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :remote_chrome

    if ENV['CI'].blank?
      Capybara.server_host = '0.0.0.0'
      Capybara.app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}:3000"
    end
  end
end
