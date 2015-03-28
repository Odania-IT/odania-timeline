Rails.application.routes.draw do
	namespace :protected do
		namespace :api, defaults: {format: :json} do
			namespace :odania_timeline do
				resources :timelines, except: [:new, :edit]
			end
		end
	end

	scope '/:locale', constraints: {locale: /[a-z][a-z]/} do
		namespace :odania_timeline do
			get 'timelines' => 'timelines#index'
			get 'timelines/:id' => 'timelines#show'
		end
	end
end
