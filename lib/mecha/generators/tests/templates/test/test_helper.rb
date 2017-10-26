ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'webmock/minitest'
require 'support/page_object'

Dir[Rails.root.join('test', 'support', '**', '*.rb')].each { |f| require f }

VCR.configure do |config|
  config.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true
  config.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end

WebMock.disable_net_connect!(allow_localhost: true)

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods

    self.use_transactional_tests = false

    setup do
      DatabaseRewinder.clean_all
    end

    teardown do
      DatabaseRewinder.clean
    end
  end
end
