require 'sinatra/base'

module Sinatra
  module Jasis

    
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

  helpers Jasis

end