# HTTP/get.rb
# HTTP.get

# 20141030
# 0.9.5

# Changes since 0.8:
# 1. Can handle blocks as was the case up to 0.7.0, or pre 0.8.5 anyway.
# 0/1
# 2. ~ #get so as it can handle options for the http object.
# 1/2
# 3. ~ #get so as it can handle 301's, though it isn't smart enough to detect infinite redirects.
# 2/3
# 4. + require 'openssl', since it seems to explicitly need to be required as of Ruby 2 somewhere.
# 3/4
# 5. Enabled Basic authentication to be automatically applied if there is a username and password in the supplied uri.
# 4/5
# 6. Version number bump to match the change to HTTP.post.

require 'net/http'
require 'openssl'
require 'uri'
require 'Hash/x_www_form_urlencode'

module URI
  class HTTP

    def use_ssl?
      scheme == 'https' ? true : false
    end

  end
end

class Net::HTTP::Get

  def set_headers(headers = {})
    headers.each{|k,v| self[k] = v}
  end
  alias_method :headers=, :set_headers

end

module HTTP

  def get(uri, args = {}, headers = {}, options = {}, &block)
    uri = URI.parse(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = options[:use_ssl] || uri.use_ssl?
    http.verify_mode = options[:verify_mode] || OpenSSL::SSL::VERIFY_NONE
    options.each{|k,v| http.send("#{k}=", v)}
    request_object = Net::HTTP::Get.new(uri.request_uri + '?' + args.x_www_form_urlencode)
    request_object.headers = headers
    request_object.basic_auth(uri.user, uri.password) if uri.user
    response = http.request(request_object)
    if response.code == '301'
      new_uri = URI.parse(response.header['location'])
      if uri.user
        if uri.password
          new_uri_sans_args = "#{new_uri.scheme}://#{uri.user}:#{uri.password}@#{new_uri.host}#{new_uri.path}"          
        else
          new_uri_sans_args = "#{new_uri.scheme}://#{uri.user}@#{new_uri.host}#{new_uri.path}"
        end
      else
        new_uri_sans_args = "#{new_uri.scheme}://#{new_uri.host}#{new_uri.path}"
      end
      get(new_uri_sans_args, args, headers, options, &block)
    end
    if block_given?
      yield response
    else
      response
    end
  end

  module_function :get

end
