ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation, {except: %w[public.schema_migrations]}

class ActiveSupport::TestCase
  def setup
    DatabaseCleaner.start
  end

  def tear_down
    DatabaseCleaner.clean
  end
end
