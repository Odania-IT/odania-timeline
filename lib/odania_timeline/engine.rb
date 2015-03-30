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

		# Add content types
		Odania::TargetType.targets['TIMELINES'] = {type: 'TIMELINES',
										module: 'OdaniaTimeline::EngineTargetType', validator_func: 'validate_timelines',
										render_func: '', selector: 'protected/odania_timeline/timelines/choose_timelines',
										initial_data: 'admin/api/menu_items/empty_inital_data'}
		Odania::TargetType.targets['TIMELINE'] = {type: 'TIMELINE',
										module: 'OdaniaTimeline::EngineTargetType', validator_func: 'validate_timeline',
										render_func: '', selector: 'protected/odania_timeline/timelines/choose_timeline',
										initial_data: 'protected/api/odania_timeline/timelines/inital_data'}
	end
end
