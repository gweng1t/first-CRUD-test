Rails.application.routes.draw do
	root 'statics_pages#home'

	resources :gossips


	# ressources :post
end
