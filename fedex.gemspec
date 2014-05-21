# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fedex"
  s.version = "3.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jazmin Schroeder"]
  s.date = "2014-05-21"
  s.description = "Provides an interface to Fedex Web Services"
  s.email = ["jazminschroeder@gmail.com"]
  s.files = [".gitignore", ".rspec", "Gemfile", "Rakefile", "Readme.md", "fedex.gemspec", "lib/fedex.rb", "lib/fedex/address.rb", "lib/fedex/credentials.rb", "lib/fedex/document.rb", "lib/fedex/helpers.rb", "lib/fedex/label.rb", "lib/fedex/rate.rb", "lib/fedex/request/address.rb", "lib/fedex/request/base.rb", "lib/fedex/request/document.rb", "lib/fedex/request/label.rb", "lib/fedex/request/rate.rb", "lib/fedex/request/shipment.rb", "lib/fedex/request/tracking_information.rb", "lib/fedex/shipment.rb", "lib/fedex/tracking_information.rb", "lib/fedex/tracking_information/event.rb", "lib/fedex/version.rb", "spec/config/fedex_credentials.example.yml", "spec/lib/fedex/address_spec.rb", "spec/lib/fedex/document_spec.rb", "spec/lib/fedex/label_spec.rb", "spec/lib/fedex/rate_spec.rb", "spec/lib/fedex/shipment_spec.rb", "spec/lib/fedex/track_spec.rb", "spec/spec_helper.rb", "spec/support/credentials.rb", "spec/support/vcr.rb"]
  s.homepage = "https://github.com/jazminschroeder/fedex"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "fedex"
  s.rubygems_version = "2.0.3"
  s.summary = "Fedex Web Services"
  s.test_files = ["spec/config/fedex_credentials.example.yml", "spec/lib/fedex/address_spec.rb", "spec/lib/fedex/document_spec.rb", "spec/lib/fedex/label_spec.rb", "spec/lib/fedex/rate_spec.rb", "spec/lib/fedex/shipment_spec.rb", "spec/lib/fedex/track_spec.rb", "spec/spec_helper.rb", "spec/support/credentials.rb", "spec/support/vcr.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.8.3"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.5.6"])
      s.add_development_dependency(%q<rspec>, ["~> 2.9.0"])
      s.add_development_dependency(%q<vcr>, ["~> 2.0.0"])
      s.add_development_dependency(%q<webmock>, ["~> 1.8.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0.8.3"])
      s.add_dependency(%q<nokogiri>, [">= 1.5.6"])
      s.add_dependency(%q<rspec>, ["~> 2.9.0"])
      s.add_dependency(%q<vcr>, ["~> 2.0.0"])
      s.add_dependency(%q<webmock>, ["~> 1.8.0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.8.3"])
    s.add_dependency(%q<nokogiri>, [">= 1.5.6"])
    s.add_dependency(%q<rspec>, ["~> 2.9.0"])
    s.add_dependency(%q<vcr>, ["~> 2.0.0"])
    s.add_dependency(%q<webmock>, ["~> 1.8.0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
