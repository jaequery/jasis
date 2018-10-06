class App < Sinatra::Base

  # helpers  
  helpers do 
    
    # outputs json response with http status code 
    def output(obj, code = 200)      
      halt code, obj.to_json if obj.present?
      return false
    end

    # email using pony
    def email(data, template = nil)
      if template.present?
        file = template[:file]
        x = file.split(".")
        ext = x.last.downcase

        case ext
        when 'erb'
          locals = template[:data]          
          body = Erubis::Eruby.new(File.read(file)).result(bindings_from_hash(locals))
        when 'liquid'
          liquid = Liquid::Template.parse(File.read(file))
          body = liquid.render(template[:data])
        end
        
        data[:html_body] = body
      end
      Pony.mail(data)
    end

    def bindings_from_hash(**vars)
      b = binding
      vars.each do |k, v|
        b.local_variable_set k.to_sym, v
      end
      return b
    end

    def debug
      require 'pry-remote'; binding.remote_pry
    end

  end

  # base configuration
  configure do

    # set app defaults
    enable :sessions
    use Rack::Session::Pool
    set :views, File.expand_path('../views', __FILE__)  
    set :root, File.dirname(__FILE__)
    set :public_folder, 'public'
    set :static, true
    set :strict_paths, false
    
    # set omniauth (SSO)
    use OmniAuth::Builder do
      provider :facebook,  ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], {:provider_ignores_state => true} if ENV['FACEBOOK_KEY'].present?
      provider :instagram,  ENV['INSTAGRAM_KEY'], ENV['INSTAGRAM_SECRET'], {:provider_ignores_state => true} if ENV['INSTAGRAM_KEY'].present?
    end

    # set mailer
    Pony.options = {
      :from => ENV['EMAIL_DEFAULT_FROM'],
      :via => :smtp,
      :via_options => {
        :address => ENV['EMAIL_HOST'],
        :port => ENV['EMAIL_PORT'],        
        :user_name => ENV['EMAIL_USERNAME'],
        :password => ENV['EMAIL_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    } if ENV['EMAIL_HOST'].present?

  end

  # dev configuration
  configure :development do        
    
    # enable hot-reload
    register Sinatra::Reloader     
    also_reload 'models/*.rb'
    
    # enable error debugger
    bettererrors = false if bettererrors.nil?
    if !bettererrors
      use BetterErrors::Middleware
      BetterErrors.application_root = __dir__
      BetterErrors::Middleware.allow_ip! '172.0.0.0/0'
      bettererrors = true
    end

  end


  before do 
    
    if request.body.size > 0      
      request.body.rewind
      h = ActiveSupport::JSON.decode(request.body.read)
      @params = h.symbolize if h.class == Hash
    end
    
  end
  
  # will be used to display 404 error pages
  # not_found do
  #   title 'Not Found!'
  #   erb :not_found
  # end

end