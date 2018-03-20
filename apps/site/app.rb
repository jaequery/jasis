class DefaultController < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/about' do
    "about"
  end

  get '/contact' do
    "contact me"
  end

end

