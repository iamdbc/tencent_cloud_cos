require "tencent_cloud_cos/version"
require "tencent_cloud_cos/configuration"
require "tencent_cloud_cos/authorization"
require "tencent_cloud_cos/api"

module TencentCloudCos
  class << self
    include Api

    def configure
      @configuration ||= Configuration.new
      yield @configuration
    end

    def config
      @configuration
    end

  end
end
