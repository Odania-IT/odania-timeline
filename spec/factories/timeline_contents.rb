FactoryGirl.define do
	factory :timeline_content, :class => 'OdaniaTimeline::TimelineContent' do
		from_date { FFaker::Time.date }
		to_date { FFaker::Time.date }
		title { FFaker::Job.title }
		body { FFaker::HTMLIpsum.body }
	end

end
