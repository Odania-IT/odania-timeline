require 'odania_core'
require 'odania'

module OdaniaTimeline
	PLUGIN_NAME = 'odania_timeline'

	class Engine < ::Rails::Engine
		config.generators do |g|
			g.test_framework :rspec
			g.fixture_replacement :factory_girl, :dir => 'spec/factories'
		end

		Odania.protected.plugins << OdaniaTimeline::PLUGIN_NAME
		Odania.protected.pages << {name: 'Timelines', in_menu: true, path: '/odania_timeline/timelines', controller: 'OdaniaTimelineTimelinesController',
											template: 'odania_timeline/timelines/index', active: OdaniaTimeline::PLUGIN_NAME}
		Odania.protected.pages << {name: 'New Timeline', in_menu: false, path: '/odania_timeline/timelines/new', controller: 'OdaniaTimelineEditTimelineController',
											template: 'odania_timeline/timelines/edit', active: OdaniaTimeline::PLUGIN_NAME}
		Odania.protected.pages << {name: 'Edit Timeline', in_menu: false, path: '/odania_timeline/timelines/:id', controller: 'OdaniaTimelineTimelineController',
											template: 'odania_timeline/timelines/show', active: OdaniaTimeline::PLUGIN_NAME}
		Odania.protected.pages << {name: 'Edit Timeline', in_menu: false, path: '/odania_timeline/timelines/:id/edit', controller: 'OdaniaTimelineEditTimelineController',
											template: 'odania_timeline/timelines/edit', active: OdaniaTimeline::PLUGIN_NAME}
	end
end
