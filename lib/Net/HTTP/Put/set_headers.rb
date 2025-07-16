# Net/HTTP/Put/set_headers.rb
# Net::HTTP::Put#set_headers

# 20250716
# 0.0.0

class Net::HTTP::Put

  def set_headers(headers = {})
    headers.each{|k,v| self[k] = v}
  end
  alias_method :headers=, :set_headers

end
