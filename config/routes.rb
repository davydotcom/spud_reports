Rails.application.routes.draw do
	namespace :spud do
		namespace :admin do
			resources :printers do
				resources :jobs, :controller => "printers/jobs"
			end
		end
	end
	resources :jobs
end
