class OdaniaTimeline::Timeline < ActiveRecord::Base
	belongs_to :site, :class_name => 'Odania::Site'
	belongs_to :language, :class_name => 'Odania::Language'
	belongs_to :user, :class_name => 'Odania::User'
	has_many :timeline_contents, class_name: 'OdaniaTimeline::TimelineContent', dependent: :delete_all

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
