class OdaniaTimeline::Timeline < ActiveRecord::Base
	has_many :timeline_contents, class_name: 'OdaniaTimeline::TimelineContent'

	accepts_nested_attributes_for :timeline_contents, allow_destroy: true, reject_if: proc { |attributes| attributes['title'].blank? }

	validates_length_of :title, minimum: 2

	def to_param
		"#{self.id}-#{self.title.parameterize}"
	end

	before_create do
		self.is_public = true if self.is_public.nil?

		true
	end
end
