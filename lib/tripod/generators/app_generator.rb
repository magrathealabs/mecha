require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Tripod
  class AppGenerator < Rails::Generators::AppGenerator
    class_option :database, default: 'postgresql'

    protected

    def get_builder_class
      Tripod::AppBuilder
    end
  end
end
