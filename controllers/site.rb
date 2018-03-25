class SiteApp < App  

  configure do
    set :layout => 'site_layout'.to_sym
  end

  get "/" do
    session[:name] = 'jae'
    erb :index
  end

  get "/abort" do
    abort
  end

  get "/about" do
    "name is: #{session[:name]}"
  end

  get '/email' do

    res = email({:to => 'jaequery@gmail.com', :subject => 'hi'}, {:file => "emails/welcome.liquid", :data => {'name' => 'watup'} })
    res
  end

end

