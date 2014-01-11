# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'osx/copy/tags/version'

Gem::Specification.new do |spec|
  spec.name          = "osx-copy-tags"
  spec.version       = Osx::Copy::Tags::VERSION
  spec.authors       = ["Fabian Renner"]
  spec.email         = ["rennerfabian@icloud.com"]
  spec.summary       = "Copying tags from files of one to another folder"
  spec.description   = "This gem copies the tags of name-matching files from one directory to another. Directories are given als commandline arguments."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
