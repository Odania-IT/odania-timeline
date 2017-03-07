require 'rails_helper'

RSpec.describe OdaniaTimeline::TimelinesController, type: :controller do
	before :each do
		@site = create(:site)
		@request.host = @site.host

		@language = create(:language)
		create_list(:timeline, 25, :with_contents, site: @site, language: @language)
		@timeline = create(:timeline, :with_contents, user: OdaniaTestMock.current_user, site: @site, language: @language)
	end

	context 'public display' do
		it 'should display public timelines' do
			get :index, params: {locale: @language.iso_639_1}

			expect(response).to be_success
			expect(response).to render_template('odania_timeline/timelines/index')
		end

		it 'should display timeline' do
			get :show, params: {id: @timeline.id, locale: @language.iso_639_1}

			expect(response).to be_success
			expect(response).to render_template('odania_timeline/timelines/show')
		end
	end
end
