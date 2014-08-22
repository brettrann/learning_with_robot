# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robot_simulator/version'

Gem::Specification.new do |spec|
  spec.name          = "robot_simulator"
  spec.version       = RobotSimulator::VERSION
  spec.authors       = ["Brett Rann"]
  spec.email         = ["brettrann@gmail.com"]
  spec.summary       = %q{implementing the Robot Simulator code test}
  spec.description   = %q{learning ruby as I go so lots of iterating}
  spec.homepage      = "http://github.com/brann/learning_with_robot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
