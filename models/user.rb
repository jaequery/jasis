class User < Sequel::Model
  
  plugin :secure_password, include_validations: false
  plugin :timestamps    
  
end