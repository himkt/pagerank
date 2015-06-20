# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pagerank/version'

Gem::Specification.new do |spec|
  spec.name          = "pagerank"
  spec.version       = Pagerank::VERSION
  spec.authors       = ["himkt"]
  spec.email         = ["himkt@klis.tsukuba.ac.jp"]

  spec.summary       = %q{Simple pagerank calculator.}
  spec.description   = %q{This gem provides you a simple and easy way to calculate pagerank.}
  spec.homepage      = "https://github.com/himkt/pagerank"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
