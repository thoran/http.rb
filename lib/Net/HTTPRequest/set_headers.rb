# Net/HTTPRequest/set_headers.rb
# Net::HTTPRequest#set_headers

require 'net/http'

module Net
  class HTTPRequest
    def set_headers(headers = {})
      headers.each{|k,v| self[k] = v}
    end
    alias_method :headers=, :set_headers
  end
end
