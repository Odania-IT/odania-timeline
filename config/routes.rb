Rails.application.routes.draw do
	namespace :protected do
		namespace :api, defaults: {format: :json} do
			namespace :odania_timeline do
				resources :timelines, except: [:new, :edit]
			end
		end
	end
end
