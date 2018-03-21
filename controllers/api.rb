class ApiApp < App  
  
  before do
    content_type :json
  end

  get '/test' do    
    output({:msg => 'testing 404'}, 404)
  end
  
end

