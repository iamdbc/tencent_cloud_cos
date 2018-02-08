require 'spec_helper'

describe TencentCloudCos::Authorization do
  before do
    @config = TencentCloudCos::Configuration.new
    @config.app_id     = '123456789'
    @config.secret_id  = 'fakesecretidqwerty'
    @config.secret_key = 'poiuytrewqlkjh'
    @config.host       = 'bucket-123456789.cos.ap-beijing.myqcloud.com'
    @config.uri        = '/test.jpg'
    @config.method     = 'put'

    @authorization = TencentCloudCos::Authorization.new(@config)
    @authorization.stubs(:sign_time).returns('1517289668;1517293328')
  end

  it "should get sign" do
    sign = '7aa0233f5fa59f387baa17855c61cacd403ac29d'
    expect(@authorization.sign).to eq sign
  end

  it "should get header authorization" do
    auth_header = 'q-sign-algorithm=sha1&q-ak=fakesecretidqwerty&q-sign-time=1517289668;1517293328&q-key-time=1517289668;1517293328&q-header-list=content-type;host&q-url-param-list=&q-signature=7aa0233f5fa59f387baa17855c61cacd403ac29d'
    expect(@authorization.auth_header).to eq auth_header
  end

end
