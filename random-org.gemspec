# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{random-org}
  s.version = "0.2.0"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Deah D Flaw"]
  s.date = %q{2011-05-16}
  s.description = %q{Gets array of random integers, strings, sequences and quota check from Random.org's random integer generator via HTTP.}
  s.email = %q{darnikian@gmail.com}
  s.files = ["README.textile", "VERSION.yml", "lib/random_org.rb", "test/random_org_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/deahdflaw/random-org}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
