$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'mecha'

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [Minitest::Reporters::MeanTimeReporter.new(color: true)]

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
