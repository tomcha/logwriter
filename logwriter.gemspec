# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logwriter/version'

Gem::Specification.new do |spec|
  spec.name          = "logwriter"
  spec.version       = Logwriter::VERSION
  spec.authors       = ["tomcha"]
  spec.email         = ["tomcha@tomcha.net"]

  spec.summary       = %q{This is a debug helper object of class. It makes some log text file.}
  spec.description   = %Q{This is a debug helper object of class. \nIt provides a variety of format of the log output function and it will create any text file.\n}
  spec.homepage      = "https://github.com/tomcha/logwriter"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
#  if spec.respond_to?(:metadata)
#    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
#  else
#    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
#  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
