# to enable use of models
require 'sequel'
require 'require_all'
Sequel.extension :pg_array, :pg_json, :pg_json_ops, :pg_inet
Sequel::Model.plugin(:json_serializer)
Sequel::Model.plugin(:validation_helpers)
Sequel::Model.raise_on_save_failure = true # Do not throw exceptions on failure
DB = Sequel.connect(ENV['DB']) # read from docker-compose file
Sequel::Model.db.extension(:pagination)
Sequel::Model.strict_param_setting = false
DB.extension :pg_array, :pg_json, :connection_validator
DB.pool.connection_validation_timeout = -1
require_all 'models'

# separate tasks to files in ./lib/tasks folder
Dir.glob('lib/tasks/*.rake').each { |r| load r}