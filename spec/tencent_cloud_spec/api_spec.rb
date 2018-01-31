describe TencentCloudCos::Api do
  before do
    @config = TencentCloudCos::Configuration.new
    @config.app_id     = 'app_id'
    @config.secret_id  = 'secret_id'
    @config.secret_key = 'secret_key'
    @config.host       = 'bucket-appid.cos.ap-beijing.myqcloud.com'
  end

  it "should put object get success" do
  end

  it "should put object get failed" do
  end
end
