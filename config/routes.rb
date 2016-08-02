Rails.application.routes.draw do
	root "characters#index"
	resources :houses, :characters
end
