require "rubygems"
require "bundler"

Bundler.setup
Bundler.require(:default)

Dir.glob(File.join(File.dirname(__FILE__), 'initializers', "*.rb")){ |file| load file}
Dir.glob(File.join(File.dirname(__FILE__), '..', 'lib', "*.rb")){ |file| load file}
Dir.glob(File.join(File.dirname(__FILE__), '../', "*.rb")) { |file| load file}