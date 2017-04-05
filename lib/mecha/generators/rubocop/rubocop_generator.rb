require 'rails/generators'

module Mecha
  module Generators
    class RubocopGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      def copy_rubocop
        copy_file('rubocop.yml', '.rubocop.yml')
      end
    end
  end
end
