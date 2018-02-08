RSpec.describe TencentCloudCos do
  it "has a version number" do
    expect(TencentCloudCos::VERSION).not_to be nil
  end

  it "put object to cos success" do
    # 设置为自己 bucket 的参数
    TencentCloudCos.configure do |config|
      config.app_id     = ''
      config.secret_id  = ''
      config.secret_key = ''
      config.host       = ''
    end

    file = File.open('./spec/egg.png', 'r')
    
    response = TencentCloudCos.put(file, "/#{Time.now.to_i}.png")

    expect(response.code).to eq 200
  end

  it "put object to cos failed" do
    TencentCloudCos.configure do |config|
      config.app_id     = 'app_id'
      config.secret_id  = 'secret_id'
      config.secret_key = 'secret_key'
      config.host       = 'bucket-appid.cos.ap-beijing.myqcloud.com'
    end

    file = File.open('./spec/test.jpg', 'r')
    
    response = TencentCloudCos.put(file, "/#{Time.now.to_i}.jpg")

    expect(response.code).not_to eq 200
  end

end
