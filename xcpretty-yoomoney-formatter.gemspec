Gem::Specification.new do |spec|
  spec.name          = 'xcpretty-yoomoney-formatter'
  spec.version       = '1.0.8'
  spec.authors       = ['Alxander Zalutskiy']
  spec.email         = ['zalutskii@yoomoney.ru']
  spec.description   =
    '
    Formatter for xcpretty customized to provide pretty output on TeamCity
    '
  spec.summary       = 'xcpretty custom formatter for TeamCity'
  spec.homepage      = 'https://github.com/yoomoney/xcpretty-teamcity-formatter'
  spec.license       = 'MIT'
  spec.required_ruby_version = '~> 2.2'
  spec.files         = %w[README.md LICENSE lib/yoomoney_formatter.rb bin/xcpretty-yoomoney-formatter]
  spec.executables   = ['xcpretty-yoomoney-formatter']
  spec.require_paths = ['lib']
  spec.add_dependency 'xcpretty', '~> 0.2', '>= 0.0.7'

  spec.add_development_dependency 'bacon', '~> 1.2'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
