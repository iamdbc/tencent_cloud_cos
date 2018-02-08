require 'rest-client'

module TencentCloudCos
  module Api
    def put(file, filename)
      config.method = 'put'
      config.uri    = filename
      content_type  = config.content_type

      authorization = Authorization.new(config)
      
      begin
        response = RestClient.put("#{config.host}#{config.uri}", file, 
                                  Authorization: authorization.auth_header, 
                                  host: config.host, 
                                  content_length: file.size,
                                  content_type: content_type)
      rescue RestClient::ExceptionWithResponse => e
        return e.response
      else
        return response
      end
    end
  end
end
