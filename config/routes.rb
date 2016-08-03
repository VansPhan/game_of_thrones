Rails.application.routes.draw do
	root "characters#index"
	resources :houses
	resources :characters do
		resources :traits, :except => [:edit]
	end
end
