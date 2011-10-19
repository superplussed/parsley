require "rubygems"
require "bundler"

Bundler.setup
Bundler.require(:default)

require_rel "initializers"
require_rel "../lib"