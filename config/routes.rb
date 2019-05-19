Rails.application.routes.draw do
	root to: 'foods#cook_calculator_new'

	get '/foods/cook_calculator', to: 'foods#cook_calculator_new'
	post '/foods/cook_calculator', to: 'foods#cook_calculator'
end
