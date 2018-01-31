
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tencent_cloud_cos/version"

Gem::Specification.new do |spec|
  spec.name          = "tencent_cloud_cos"
  spec.version       = TencentCloudCos::VERSION
  spec.authors       = ["iamdbc"]
  spec.email         = [""]

  spec.summary       = %q{tencent cloud cos sdk.}
  spec.description   = %q{tencent cloud cos sdk.}
  spec.homepage      = "https://github.com/iamdbc/tencent_cloud_cos"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "mocha"
end
