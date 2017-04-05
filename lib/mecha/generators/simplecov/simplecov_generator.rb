require 'rails/generators'

module Mecha
  module Generators
    class SimplecovGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      def copy_simplecov
        copy_file('simplecov', '.simplecov')
      end
    end
  end
end
