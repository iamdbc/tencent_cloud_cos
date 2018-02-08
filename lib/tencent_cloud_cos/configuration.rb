module TencentCloudCos
  class Configuration
    # uri: 上传文件名称
    # method: 请求签名方法
    attr_accessor :app_id, :secret_id, :secret_key, :bucket, :host, :uri, :method, :content_type

    def content_type
      @content_type || 'image/jpeg'
    end
  end
end
