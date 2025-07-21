# HTTP.rb
# HTTP

lib_dir = File.expand_path(File.join(__FILE__, '..'))
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'HTTP/get'
require 'HTTP/post'
require 'HTTP/put'
require 'HTTP/delete'
