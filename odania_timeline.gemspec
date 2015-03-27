$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'odania_timeline/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
	s.name = 'odania_timeline'
	s.version = OdaniaTimeline::VERSION
	s.authors = ['Mike Petersen']
	s.email = ['mike@odania-it.de']
	s.homepage = 'http://www.odania.de'
	s.summary = 'Odania Portal Plugin: Timeline'
	s.description = 'The Odania Portal is an open source portal system with strong focus on the usage on different domains with different layout/setup.'

	s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'MIT-LICENSE', 'README.rdoc']
	s.test_files = Dir['test/**/*']

	s.add_dependency 'rails'
	s.add_dependency 'odania_core'
end
