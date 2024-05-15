require 'rspec'
require "rubygems"
require 'cucumber'
require 'httparty'
require 'selenium-webdriver'
require 'site_prism'
require 'capybara/cucumber'
require 'capybara-screenshot'
require 'capybara-screenshot/cucumber'
require 'capybara-screenshot/rspec'
require 'capybara/rspec'
require 'pry'
require 'page-object'
require 'data_magic'

##World(PageObject::PageFactory)

#Configurando o driver do capybara
Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

#Fixando a configuração do driver como padrão
Capybara.default_driver = :selenium

#timeout padrão na execução
Capybara.default_max_wait_time = 15

#Maximizar a tela ao iniciar o teste
Capybara.page.driver.browser.manage.window.maximize

# Driver de Execução Chrome Headless (Default)
Capybara.register_driver :selenium_chrome_headless do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => { 'args' =>["--headless", '--no-sandbox', '--start-fullscreen'] } )
  Capybara::Selenium::Driver.new(app, :browser => :chrome, desired_capabilities: capabilities)
end

#Config escolha Browser de execução
@driver = case ENV['BROWSER']
when 'chrome'
  :chrome
else
  :selenium_chrome_headless
end
