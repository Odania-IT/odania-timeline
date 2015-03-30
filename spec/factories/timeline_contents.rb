FactoryGirl.define do
	factory :timeline_content, :class => 'OdaniaTimeline::TimelineContent' do
		timeline_date { FFaker::Time.date }
		title { FFaker::Job.title }
		body { FFaker::HTMLIpsum.body }
	end

end
