class User < Sequel::Model
  
  plugin :secure_password
  plugin :timestamps    
  
end