module OdaniaTimeline
	module EngineTargetType
		class << self
			def validate_timelines(menu_item, target_data)
				menu_item.full_path = 'odania_timeline/timelines'

				nil
			end

			def validate_timeline(menu_item, target_data)
				return 'invalid timeline id' if target_data['id'].nil?

				timeline = OdaniaTimeline::Timeline.where(id: target_data['id']).first
				return 'invalid timeline id' if timeline.nil?

				menu_item.full_path = "odania_timeline/timelines/#{timeline.to_param}"

				return nil
			end
		end
	end
end
