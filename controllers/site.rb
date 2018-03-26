class SiteApp < App  

  configure do
    set :layout => 'site_layout'.to_sym
  end

  get "/" do
    erb :index
  end

  get "/abort" do
    abort
  end


end

