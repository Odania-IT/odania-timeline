require 'rails_helper'

RSpec.describe Protected::Api::OdaniaTimeline::TimelinesController, type: :controller do
	before :each do
		@site = create(:site)
		@request.host = @site.host

		@language = create(:language)
		create_list(:timeline_with_contents, 25, site: @site, language: @language)
		@timeline = create(:timeline_with_contents, user: OdaniaTestMock.current_user, site: @site, language: @language)
	end

	context 'when not logged in' do
		it 'should give unauthorized' do
			OdaniaTestMock.signed_in = false
			get :index, {format: :json}
			OdaniaTestMock.signed_in = true

			expect(response.response_code).to be(302)
		end
	end

	context 'when logged in' do
		it 'should list timelines' do
			get :index, {format: :json}

			expect(response).to be_success
			expect(response).to render_template('protected/api/odania_timeline/timelines/index')
		end

		it 'should return timeline' do
			get :show, {id: @timeline, format: :json}

			expect(response).to be_success
			expect(response).to render_template('protected/api/odania_timeline/timelines/show')
		end

		it 'should create timeline' do
			timeline = build(:timeline)

			assert_difference 'OdaniaTimeline::Timeline.count' do
				assert_difference 'OdaniaTimeline::TimelineContent.count', 5 do
					post :create, {format: :json, timeline: {title: timeline.title, is_public: false, timeline_contents_attributes: [
										{title: FFaker::Movie.title, body: FFaker::HTMLIpsum.body, timeline_date: FFaker::Time.date},
										{title: FFaker::Movie.title, body: FFaker::HTMLIpsum.body, timeline_date: FFaker::Time.date},
										{title: FFaker::Movie.title, body: FFaker::HTMLIpsum.body, timeline_date: FFaker::Time.date},
										{title: FFaker::Movie.title, body: FFaker::HTMLIpsum.body, timeline_date: FFaker::Time.date},
										{title: FFaker::Movie.title, body: FFaker::HTMLIpsum.body, timeline_date: FFaker::Time.date}
									]}}
				end
			end

			expect(response).to be_success
			expect(response).to render_template('protected/api/odania_timeline/timelines/show')
		end

		it 'should delete timeline and contents' do
			assert_difference 'OdaniaTimeline::Timeline.count', -1 do
				assert_difference 'OdaniaTimeline::TimelineContent.count', -@timeline.timeline_contents.count do
					delete :destroy, {id: @timeline, format: :json}
				end
			end
		end
	end
end
