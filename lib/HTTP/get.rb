# HTTP/get.rb
# HTTP.get

require 'net/http'

require_relative '../Hash/x_www_form_urlencode'
require_relative './request'

module HTTP
  def get(uri, args = {}, headers = {}, options = {}, &block)
    uri = uri.is_a?(URI) ? uri : URI.parse(uri)
    request_uri = uri.request_uri
    unless args.empty?
      request_uri += '?' + args.x_www_form_urlencode
    end
    request_object = Net::HTTP::Get.new(request_uri)
    request(uri, request_object, headers, options, &block)
  end

  module_function :get
end
