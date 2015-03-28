class Protected::Api::OdaniaTimeline::TimelinesController < Protected::ApiController
	before_action :verify_timeline, except: [:index, :create]

	def index
		@timelines = OdaniaTimeline::Timeline.where(user_id: current_user.id).order('created_at DESC')
	end

	def show
	end

	def create
		@timeline = OdaniaTimeline::Timeline.new(timeline_params)
		@timeline.user_id = current_user.id
		@timeline.site_id = current_site.id
		@timeline.language_id = current_site.default_language_id

		if @timeline.save
			flash[:notice] = t('created')
			render action: :show
		else
			render json: {errors: @timeline.errors}, status: :bad_request
		end
	end

	def update
		if @timeline.update(timeline_params)
			flash[:notice] = t('updated')
			render action: :show
		else
			render json: {errors: @timeline.errors}, status: :bad_request
		end
	end

	def destroy
		@timeline.destroy

		flash[:notice] = t('deleted')
		render json: {message: 'deleted'}
	end

	private

	def verify_timeline
		@timeline = OdaniaTimeline::Timeline.where(user_id: current_user.id, id: params[:id]).first
		bad_api_request('resource_not_found') if @timeline.nil?
	end

	def timeline_params
		params.require(:timeline).permit(:title, :is_public, timeline_contents_attributes: [:id, :title, :body, :timeline_date])
	end
end
