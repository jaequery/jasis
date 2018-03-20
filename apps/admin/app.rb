class AdminController < Sinatra::Base

  get '/admin' do
    erb :index
  end

end

