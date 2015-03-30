FactoryGirl.define do
	factory :timeline, :class => 'OdaniaTimeline::Timeline' do
		site
		user
		language
		title { FFaker::Company.name }
		is_public true

		factory :timeline_with_contents do
			# Default value for amount of items
			transient do
				amount 2
			end

			after(:create) do |timeline, evaluator|
				create_list(:timeline_content, evaluator.amount, timeline: timeline)
			end
		end
	end

end
