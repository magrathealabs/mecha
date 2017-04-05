module Mecha
  module Generators
    class AppBuilder < Rails::AppBuilder
      def readme
        template('README.md.erb', 'README.md')
      end

      def gemfile
        template('Gemfile.erb', 'Gemfile')
      end

      def gitignore
        template('gitignore.erb', '.gitignore')
      end

      def database_yml
        template "config/databases/#{options[:database]}.yml.erb", 'config/database.example.yml'
        template "config/databases/#{options[:database]}.yml.erb", 'config/database.yml'
      end

      def config_application
        inject_into_class('config/application.rb', 'Application') { config_autoload_paths }
        inject_into_class('config/application.rb', 'Application') { config_generators }
        create_file('app/services/.keep')
        create_file('app/uploaders/.keep')
      end

      def leftovers
        config_application
      end

      private

      def config_autoload_paths
        <<-DOC
      config.autoload_paths += %W(\#{config.root}/lib \#{config.root}/app/uploaders \#{config.root}/services)
        DOC
      end

      def config_generators
        <<-DOC
      config.generators do |g|
        g.view_specs    false
        g.routing_specs false
        g.stylesheets   false
        g.javascripts   false
        g.helper        false
      end
        DOC
      end
    end
  end
end
