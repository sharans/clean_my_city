CleanMyCity::Application.routes.draw do
  root :to => 'garbage_tickets#new'
  resources :garbage_tickets, only: [:new, :create]
  match '/garbage_tickets/visualize', to: "garbage_tickets#visualize", as: :visualize
end
