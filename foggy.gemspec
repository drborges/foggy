# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foggy/version'

Gem::Specification.new do |spec|
  spec.name          = "foggy"
  spec.version       = Foggy::VERSION
  spec.authors       = ["Diego Borges"]
  spec.email         = ["drborges.cic@gmail.com"]

  spec.summary       = %q{Bring remote attachments closer to your app.}
  spec.description   = %q{Sometimes you need to abstract the fact remote attachments stored say in S3 aren't locally. Foggy can help you with that by creating a temp local file whenever you need to manipulate the remote asset.}
  spec.homepage      = "https://drborges.github.io/paperclip-foggy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "activerecord", "= 3.2.22.5"
  spec.add_development_dependency "sqlite3"

  spec.add_dependency "paperclip", "= 4.3.1"
end
