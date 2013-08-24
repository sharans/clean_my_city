CleanMyCity::Application.routes.draw do
  resources :garbage_tickets, only: [:new, :create]
  match '/garbage_tickets/visualize', to: "garbage_tickets#visualize", as: :visualize
end
