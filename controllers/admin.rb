class AdminApp < App
  
  configure do
    set :erb, :layout => 'admin/layout'.to_sym
  end

  get '/' do
    erb :'admin/index'
  end

end

