helpers do
  def output(obj, code = 200) 
    halt code, obj.to_json
  end
end