
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ttsttb/version"

Gem::Specification.new do |spec|
  spec.name          = "ttsttb"
  spec.version       = Ttsttb::VERSION
  spec.authors       = ["Yuki Matsukura"]
  spec.email         = ["matsubokkuri@gmail.com"]

  spec.summary       = %q{Fetch TTS and TTB corresponding to the date.}
  spec.description   = %q{Scraping TTS and TTB data from http://www.murc-kawasesouba.jp/fx/index.php}
  spec.homepage      = "https://github.com/matsubo/ttsttb"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
          "public gem pushes."
  end

  spec.required_ruby_version = '>= 2.7'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"

  spec.add_runtime_dependency 'nokogiri'

end
