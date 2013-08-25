CleanMyCity::Application.routes.draw do
  root :to => 'garbage_tickets#new'
  resources :garbage_tickets, only: [:new, :create]
  match '/garbage_tickets/destroy', to: "garbage_tickets#destroy", as: :delete_ticket
  match '/garbage_tickets/visualize', to: "garbage_tickets#visualize", as: :visualize
end
