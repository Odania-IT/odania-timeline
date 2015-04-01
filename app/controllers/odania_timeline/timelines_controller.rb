class OdaniaTimeline::TimelinesController < ApplicationController
	before_action :valid_site!, :valid_menu!

	def index
		@timelines = OdaniaTimeline::Timeline.where(is_public: true).order('updated_at DESC')
	end

	def show
		@timeline = OdaniaTimeline::Timeline.where(is_public: true, id: params[:id].to_i).first
		redirect_to odania_timeline_timelines_path if @timeline.nil?
	end
end
