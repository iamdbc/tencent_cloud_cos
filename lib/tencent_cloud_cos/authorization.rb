require "digest"
require "openssl"

module TencentCloudCos
  class Authorization
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def sign
      sign_key = OpenSSL::HMAC.hexdigest('sha1', secret_key, sign_time)
      http_string = "#{method}\n#{uri}\n\ncontent-type=#{content_type}&host=#{host}\n"
      sha1ed_http_string = Digest::SHA1.hexdigest http_string
      string_to_sign = "sha1\n#{sign_time}\n#{sha1ed_http_string}\n"
      signature = OpenSSL::HMAC.hexdigest('sha1', sign_key, string_to_sign)
    end

    def auth_header
      auth = "q-sign-algorithm=sha1&q-ak=#{secret_id}&q-sign-time=#{sign_time}&q-key-time=#{sign_time}&q-header-list=content-type;host&q-url-param-list=&q-signature=#{sign}"
    end

    private

    def host
      @config.host
    end

    def secret_id
      @config.secret_id
    end

    def secret_key
      @config.secret_key
    end

    def uri
      @config.uri
    end

    def method
      @config.method
    end

    def sign_time
      "#{Time.now.to_i-60};#{Time.now.to_i + 3600}"
    end

    def content_type
      URI::escape(@config.content_type, /\W/)
    end

  end

end
