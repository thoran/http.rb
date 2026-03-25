# Hash/x_www_form_urlencode.rb
# Hash#x_www_form_urlencode

require_relative '../String/url_encode'

class Hash
  def x_www_form_urlencode(joiner = '&')
    inject([]){|a,e| a << "#{e.first.to_s.url_encode.gsub(/ /, '+')}=#{e.last.to_s.url_encode.gsub(/ /, '+')}" unless e.last.nil?; a}.join(joiner)
  end
end
