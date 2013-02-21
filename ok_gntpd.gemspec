# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ok_gntpd/version'

Gem::Specification.new do |gem|
  gem.name          = "ok_gntpd"
  gem.version       = OkGntpd::VERSION
  gem.authors       = ["Masato Ikeda"]
  gem.email         = ["masato.ikeda@gmail.com"]
  gem.description   = %q{An GNTPd which always return "OK".}
  gem.summary       = %q{An GNTPd which always return "OK".}
  gem.homepage      = "https://github.com/a2ikm/ok_gntpd"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
