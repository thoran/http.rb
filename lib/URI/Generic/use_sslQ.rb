# URI/Generic/use_sslQ.rb
# URI::Generic#use_ssl?

require 'uri'

module URI
  class Generic
    def use_ssl?
      scheme == 'https' ? true : false
    end
  end
end
