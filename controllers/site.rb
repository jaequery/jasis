class SiteApp < App  
      
  get '/' do    
    erb :index
  end

  get '/api/users' do
    content_type :json
    output({:name => 'jame'}, 404)
  end
  
end

