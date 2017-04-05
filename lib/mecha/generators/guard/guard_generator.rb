require 'rails/generators'

module Mecha
  module Generators
    class GuardGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      def copy_guardfile
        copy_file('Guardfile', 'Guardfile')
      end
    end
  end
end
