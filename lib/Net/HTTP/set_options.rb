# Net/HTTP/set_options.rb
# Net::HTTP#set_options

require 'net/http'

module Net
  class HTTP
    def set_options(options = {})
      options.each{|k,v| self.send("#{k}=", v)}
    end
    alias_method :options=, :set_options
  end
end
