require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Mecha
  class AppGenerator < Rails::Generators::AppGenerator
    class_option :database, default: 'postgresql'

    protected

    def get_builder_class
      Mecha::AppBuilder
    end
  end
end
