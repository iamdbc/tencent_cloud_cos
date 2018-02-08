# TencentCloudCos

用于腾讯云 COS 存储。

TODO:
- [x] 上传资源到 COS
- [ ] 增加更多接口

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tencent_cloud_cos'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tencent_cloud_cos

## Usage

以下配置项都在腾讯云 COS 查找，host 就是访问域名，选择适用于 XML API 那个，JSON API 那个测试不成功。

*注: host 千万不要加 https://*

```ruby
TencentCloudCos.configure do |config|
    config.app_id     = 'app_id'
    config.secret_id  = 'secret_id'
    config.secret_key = 'secret_key'
    config.host       = 'bucket-appid.cos.ap-beijing.myqcloud.com'
end

# 默认设置 content_type 为 image/jpeg，如需修改，请按如下设置
TencentCloudCos.config.content_type = 'image/png'

file = File.open('./uploadfile.jpg', 'r')

# 第一个参数是要上传的文件，第二个是要上传的文件名，文件名必须以 '/' 开头，相同资源名会覆盖

response = TencentCloudCos.put(file, "/filename.jpg")

response.code == 200 # 200 代表成功，否则失败，查看 response.headers 的详情 。
```

**腾讯云 COS 默认的访问域名打开资源是下载，需要在存储桶基础配置中打开“静态网站”的设置，之后用静态网站加资源名称访问，即为在线预览。**

## Test

修改 spec/tencent_cloud_cos_spec.rb 中 TencentCloudCos 相关配置为自己 bucket 的配置，否则测试 TencentCloudCos.put 会报错。

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iamdbc/tencent_cloud_cos. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TencentCloudCos project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/iamdbc/tencent_cloud_cos/blob/master/CODE_OF_CONDUCT.md).
