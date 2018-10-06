# load sinatra
require 'sinatra'


# load dotenv
require 'dotenv/load'


# load activesupport
require 'active_support/all'


# load autoloader
require 'require_all'


# init development 
if development?
  require 'ap' # pretty print
  require 'sinatra/reloader' # hot-reload
  require "better_errors" # bettererror
  require "pry"
  require 'pry-remote'
end


# init omniauth
require 'omniauth'
require 'omniauth-facebook'
require 'omniauth-instagram'


# init logging
require 'logger'
logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG
set :logger, logger


# init database
require 'sequel'
Sequel.extension :pg_array, :pg_json, :pg_json_ops, :pg_inet
Sequel::Model.plugin(:json_serializer)
Sequel::Model.plugin(:validation_helpers)
Sequel::Model.raise_on_save_failure = true # Do not throw exceptions on failure
DB = Sequel.connect(ENV['DB']) # read from docker-compose file
DB.loggers << logger
Sequel::Model.db.extension(:pagination)
Sequel::Model.strict_param_setting = false
DB.extension :pg_array, :pg_json, :connection_validator
DB.extension :auto_literal_strings
DB.pool.connection_validation_timeout = -1
require_all 'models'


# init mailer
require 'pony'
require 'liquid'


# sequel extensions
require 'sequel/extensions/seed'
Sequel.extension :seed
Sequel::Seeder.apply(DB, "db/seeds")


# load helpers
require_all './lib'

# load main app
require './app'

# load controllers
require_all 'controllers'



