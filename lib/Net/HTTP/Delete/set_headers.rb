# Net/HTTP/Delete/set_headers.rb
# Net::HTTP::Delete#set_headers

# 20250710
# 0.0.0

class Net::HTTP::Delete

  def set_headers(headers = {})
    headers.each{|k,v| self[k] = v}
  end
  alias_method :headers=, :set_headers

end
