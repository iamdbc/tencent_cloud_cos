module TencentCloudCos
  class Configuration
    # uri: 上传文件名称
    # method: 请求签名方法
    attr_accessor :app_id, :secret_id, :secret_key, :bucket, :host, :uri, :method
  end
end
