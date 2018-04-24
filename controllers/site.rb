class SiteApp < App  

  configure do
    set :layout => 'site_layout'.to_sym
  end

  get "/" do

    require 'pry-remote'; binding.remote_pry
    erb :index
  end

  get "/abort" do
    users = User.where(:first_name => 'Jae').all
    abort
  end

  get '/auth/facebook/callback' do
    auth = request.env["omniauth.auth"]
    user = User.login_with_omniauth(auth)

    if user
      session[:user_id] = user[:id]        
      if user.email.blank?
        redirect("/login", :notice => 'Please fill in required informations')
      end

      redirect("/")
    else
      output(user.values)
    end
  end


end

