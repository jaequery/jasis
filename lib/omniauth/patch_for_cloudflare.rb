module OmniAuth
  module Strategy

    def full_host
      uri = URI.parse(request.url)
      uri.path = ''
      uri.query = nil
      uri.port = (uri.scheme == 'https' ? 443 : 80)
      uri.to_s
    end
    
  end
end
