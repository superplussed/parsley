# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{parsley}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Jeremy Smith}]
  s.date = %q{2011-08-20}
  s.description = %q{hand history parser}
  s.email = %q{xperts@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".DS_Store",
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "config/boot.rb",
    "config/initializers/redis.rb",
    "config/initializers/redis.rbc",
    "config/initializers/ruby_prof.rb",
    "config/initializers/ruby_prof.rbc",
    "features/parser_reads_cereus_file.feature",
    "features/parser_reads_fulltilt_file.feature",
    "features/parser_reads_pokerstars_file.feature",
    "features/step_definitions/parser_steps.rb",
    "features/support/env.rb",
    "features/support/paths.rb",
    "features/support/selectors.rb",
    "features/support/textmate_spork_fix.rb",
    "files/.DS_Store",
    "files/hh/.DS_Store",
    "files/hh/cer_9max.txt",
    "files/hh/cer_9max_pl.txt",
    "files/hh/cer_limit.txt",
    "files/hh/cer_plo_6max.txt",
    "files/hh/cer_winner_showdown.txt",
    "files/hh/ftp_9max.txt",
    "files/hh/ftp_bad_format.txt",
    "files/hh/ftp_limit.txt",
    "files/hh/ftp_mult.txt",
    "files/hh/ftp_plhe.txt",
    "files/hh/ftp_plo.txt",
    "files/hh/ftp_shallow.txt",
    "files/hh/multiple_sites.txt",
    "files/hh/pst_10k.txt",
    "files/hh/pst_9max.txt",
    "files/hh/pst_bulk_hands.txt",
    "files/hh/pst_hu_sesh.txt",
    "files/hh/pst_hu_sesh_10_hands.txt",
    "files/hh/pst_hu_sesh_2_hands.txt",
    "files/hh/pst_limit.txt",
    "files/hh/pst_multiple.txt",
    "files/hh/pst_plhe.txt",
    "files/hh/pst_plo.txt",
    "files/regex/CER.json",
    "files/regex/FTP.json",
    "files/regex/PST.json",
    "files/regex/stub.json",
    "lib/error_log.rb",
    "lib/formatter.rb",
    "lib/formatter/cer_formatter.rb",
    "lib/formatter/default_formatter.rb",
    "lib/formatter/ftp_formatter.rb",
    "lib/formatter/pst_formatter.rb",
    "lib/hand.rb",
    "lib/hand_reader.rb",
    "lib/parser.rb",
    "lib/parsley.rb",
    "lib/site.rb",
    "lib/state.rb",
    "parsley.gemspec",
    "spec/site_spec.rb",
    "spec/spec_helper.rb",
    "spec/state_spec.rb",
    "test/.DS_Store",
    "test/helper.rb",
    "test/results/parser 2011-07-06 12-06-02.txt",
    "test/results/parser 2011-07-07 13-25-17.txt",
    "test/results/parser 2011-07-08 12:28:21.txt",
    "test/results/parser 2011-07-08 15:54:36.txt",
    "test/results/parser 2011-07-09 11-00-28.txt",
    "test/results/parser 2011-07-09 11:24:40.txt",
    "test/results/parser 2011-07-09 12:50:13.txt",
    "test/results/parser 2011-07-09 13-34-14.txt",
    "test/results/parser 2011-07-12 17:25:37.txt",
    "test/results/parser 2011-07-13 13:35:05.txt",
    "test/results/parser 2011-07-13 15-57-08.txt",
    "test/results/parser 2011-07-13 20:33:06.txt",
    "test/results/parser 2011-07-14 16:52:21.txt",
    "test/results/parser 2011-07-19 18:27:52.txt",
    "test/ruby_prof/empty.png",
    "test/ruby_prof/minus.png",
    "test/ruby_prof/plus.png",
    "test/ruby_prof/profile.flat.txt",
    "test/ruby_prof/profile.graph.html",
    "test/ruby_prof/profile.grind.dat",
    "test/ruby_prof/profile.stack.html",
    "test/scripts/parser.rb",
    "test/test_parsley.rb"
  ]
  s.homepage = %q{http://github.com/redCashion/parsley}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{hand history parser}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jeweler>, ["= 1.6.4"])
      s.add_runtime_dependency(%q<rcov>, ["= 0.9.10"])
      s.add_runtime_dependency(%q<redis>, ["= 2.2.2"])
      s.add_runtime_dependency(%q<yajl-ruby>, ["= 0.8.3"])
      s.add_runtime_dependency(%q<mahoro>, ["= 0.3"])
      s.add_runtime_dependency(%q<activesupport>, ["= 3.0.10"])
      s.add_runtime_dependency(%q<rubyzip>, ["= 0.9.4"])
    else
      s.add_dependency(%q<jeweler>, ["= 1.6.4"])
      s.add_dependency(%q<rcov>, ["= 0.9.10"])
      s.add_dependency(%q<redis>, ["= 2.2.2"])
      s.add_dependency(%q<yajl-ruby>, ["= 0.8.3"])
      s.add_dependency(%q<mahoro>, ["= 0.3"])
      s.add_dependency(%q<activesupport>, ["= 3.0.10"])
      s.add_dependency(%q<rubyzip>, ["= 0.9.4"])
    end
  else
    s.add_dependency(%q<jeweler>, ["= 1.6.4"])
    s.add_dependency(%q<rcov>, ["= 0.9.10"])
    s.add_dependency(%q<redis>, ["= 2.2.2"])
    s.add_dependency(%q<yajl-ruby>, ["= 0.8.3"])
    s.add_dependency(%q<mahoro>, ["= 0.3"])
    s.add_dependency(%q<activesupport>, ["= 3.0.10"])
    s.add_dependency(%q<rubyzip>, ["= 0.9.4"])
  end
end

