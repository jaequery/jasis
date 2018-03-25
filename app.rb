class App < Sinatra::Base

  # base configuration
  configure do

    # set app defaults
    enable :sessions
    use Rack::Session::Pool
    set :views, File.expand_path('../../views', __FILE__)  
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
      :from => "x@x.com",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.gmail.com',
        :port => '587',
        :domain => 'x.com',
        :user_name => 'x@x.com',
        :password => 'xxxxx',
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    }

  end

  # dev configuration
  configure :development do        
    
    # enable hot-reload
    register Sinatra::Reloader 
    
    # enable error debugger
    bettererrors = false if bettererrors.nil?
    if !bettererrors
      use BetterErrors::Middleware
      BetterErrors.application_root = __dir__
      BetterErrors::Middleware.allow_ip! '172.0.0.0/0'
      bettererrors = true
    end

  end

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
        liquid = Liquid::Template.parse(File.read(file))
        body = liquid.render(template[:data])
        data[:body] = body
      end
      Pony.mail(data)
    end

  end
  
  # will be used to display 404 error pages
  # not_found do
  #   title 'Not Found!'
  #   erb :not_found
  # end

end