require_relative './lib/HTTP/VERSION'

Gem::Specification.new do |s|
  s.name = 'http.rb'
  s.version = HTTP::VERSION
  s.date = '2025-05-01'

  s.summary = "HTTP made easy."
  s.description = "HTTP is the simplest HTTP mezzanine library for Ruby.  Supply a URI, \
    some optional query arguments, some optional headers, and some \
    Net::HTTP options, and that's it!"
  s.author = 'thoran'
  s.email = 'code@thoran.com'
  s.homepage = "http://github.com/thoran/HTTP"

  s.files = [
    'CHANGELOG.txt',
    'Gemfile',
    'README.md',
    'http.rb.gemspec',
    Dir['lib/**/*.rb'],
    Dir['spec/**/*.rb']
  ].flatten

  s.require_paths = ['lib']
end
