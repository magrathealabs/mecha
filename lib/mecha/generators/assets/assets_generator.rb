require 'rails/generators'

module Mecha
  module Generators
    class AssetsGenerator < Rails::Generators::Base
      hide!

      def install_scss
        create_file('app/assets/stylesheets/application.scss')
        remove_file('app/assets/stylesheets/application.css')
      end

      def config_application
        application(config_assets_precompile)
      end

      private

      def config_assets_precompile
        'config.assets.initialize_on_precompile = false'
      end
    end
  end
end
