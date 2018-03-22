class AdminApp < App
  
  configure do
    set :erb, :layout => :'admin/layout'
  end

  get '/' do
    erb :'admin/index'
  end

end

