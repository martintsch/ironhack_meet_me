Rails.application.routes.draw do

  root 'home#welcome'

  get 'contact' => 'home#contact'

  resources :locations do
    resources :visits
  end
end
