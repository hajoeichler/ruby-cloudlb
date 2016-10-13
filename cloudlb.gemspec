# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require File.expand_path('../lib/cloudlb/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "cloudlb"
  s.version     = CloudLB::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["H. Wade Minter"]
  s.email       = ["minter@lunenburg.org"]
  s.homepage    = "http://github.com/rackspace/ruby-cloudlb"
  s.summary     = "Ruby API into the Rackspace Cloud Load Balancers product"
  s.description = "A Ruby API to manage the Rackspace Cloud Load Balancers product"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_runtime_dependency "typhoeus"
  s.add_runtime_dependency "json", "1.6.6"

  s.files = [
    "COPYING",
    ".gitignore",
    "README.rdoc",
    "cloudlb.gemspec",
    "lib/cloudlb.rb",
    "lib/cloudlb/authentication.rb",
    "lib/cloudlb/balancer.rb",
    "lib/cloudlb/connection.rb",
    "lib/cloudlb/exception.rb",
    "lib/cloudlb/node.rb",
    "lib/cloudlb/health_monitor.rb",
    "lib/cloudlb/connection_throttle.rb",
    "lib/cloudlb/ssl_termination.rb",
    "lib/cloudlb/version.rb"
  ]
  s.require_path = 'lib'
end
