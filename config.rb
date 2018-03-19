# init auto-loader
require 'require_all'
require_all 'lib'


# init development 
if development?

  require 'ap' # pretty print
  require 'sinatra/reloader' # hot-reload

  # bettererror
  require "better_errors"
  enable :dump_errors, :raise_errors
  use BetterErrors::Middleware
  BetterErrors::Middleware.allow_ip! '172.0.0.0/0'
  
end


# init logging
require 'logger'
logger = Logger.new(File.open("log/error.log", 'a'))
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
DB.extension(:connection_validator)
DB.pool.connection_validation_timeout = -1
require_all 'models'

# init sessions
enable :sessions
require 'rack/session/moneta'
use Rack::Session::Moneta,
 domain:         '*',
 path:           '/',
 expire_after:   30*24*60*60, # one month
 secret:         ENV['SESSION_KEY'],
 store:          Moneta.new(:Redis, {
     url:            'redis://redis:6379/0',
     expires:        true,
     threadsafe:     true
 })

 
