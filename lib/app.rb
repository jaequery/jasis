class App < Sinatra::Base
  
  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  configure :development do

    register Sinatra::Reloader
    
    bettererrors = false if bettererrors.nil?
    if !bettererrors
      use BetterErrors::Middleware
      BetterErrors.application_root = __dir__
      BetterErrors::Middleware.allow_ip! '172.0.0.0/0'
      bettererrors = true
    end

  end
  
  # will be used to display 404 error pages
  # not_found do
  #   title 'Not Found!'
  #   erb :not_found
  # end
end