class OdaniaTimeline::TimelineContent < ActiveRecord::Base
	belongs_to :timeline, class_name: 'OdaniaTimeline::Timeline'

	validates_length_of :title, minimum: 2
	validates_length_of :body, minimum: 5
	validates_presence_of :from_date
end
