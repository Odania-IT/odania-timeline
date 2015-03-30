require 'odania_timeline/engine'

module OdaniaTimeline
	autoload :EngineTargetType, 'odania_timeline/engine_target_type'

	def self.table_name_prefix
		'odania_timeline_'
	end
end
