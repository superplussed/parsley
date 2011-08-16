require "rubygems"
require "bundler"

Bundler.setup
Bundler.require(:default)

Dir.glob(File.join(File.dirname(__FILE__), 'initializers', "*.rb")){ |file| require file}
Dir.glob(File.join(File.dirname(__FILE__), '../', "*.rb")) { |file| require file}