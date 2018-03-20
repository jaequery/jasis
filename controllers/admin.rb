class AdminApp < App
  
  configure do
    set :erb, :layout => :admin_layout
  end

  get '/' do
    erb :admin
  end

end

