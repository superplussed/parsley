# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{git}
  s.version = "1.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Scott Chacon}]
  s.date = %q{2009-10-17}
  s.email = %q{schacon@gmail.com}
  s.extra_rdoc_files = [%q{README}]
  s.files = [%q{README}]
  s.homepage = %q{http://github.com/schacon/ruby-git}
  s.rdoc_options = [%q{--charset=UTF-8}]
  s.require_paths = [%q{lib}]
  s.requirements = [%q{git 1.6.0.0, or greater}]
  s.rubyforge_project = %q{git}
  s.rubygems_version = %q{1.8.8}
  s.summary = %q{Ruby/Git is a Ruby library that can be used to create, read and manipulate Git repositories by wrapping system calls to the git binary}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
