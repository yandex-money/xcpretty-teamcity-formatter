# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "xcpretty-teamcity-formatter"
  spec.version       = "1.0.0"
  spec.authors       = ["Alxander Zalutskiy"]
  spec.email         = ["zalutskii@yamoney.ru"]
  spec.description   =
  %q{
  Formatter for xcpretty customized to provide pretty output on TeamCity
  }
  spec.summary       = %q{xcpretty custom formatter for TeamCity}
  spec.homepage      = "https://github.com/yandex-money/xcpretty-teamcity-formatter"
  spec.license       = "MIT"
  spec.required_ruby_version = "~> 2.0"
  spec.files         = [
  	"README.md",
  	"LICENSE",
  	"lib/teamcity_formatter.rb",
  	"bin/xcpretty-teamcity-formatter"]
  spec.executables   = ["xcpretty-teamcity-formatter"]
  spec.require_paths = ["lib"]
  spec.add_dependency "xcpretty", "~> 0.2", ">= 0.0.7"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "bacon", "~> 1.2"
end
