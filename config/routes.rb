Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :registry_coordinators
  resources :registry_participants
  resources :participants
  resources :coordinators
  resources :registries
  
  get 'home', to: 'coordinators#home'
  get 'registries/:id/add_coordinator', to: 'registry_coordinators#add_coordinator', :as => 'add_coordinator'
  get 'participants/:id/add_registry', to: 'registry_participants#add_registry', :as => 'add_registry'
  post 'participants/:id/add_registry', to: 'registry_participants#add_registry'
  get 'registries/:id/add_participant', to: 'registry_participants#add_participant', :as => 'add_participant'
  post 'registries/:id/add_participant', to: 'registry_participants#link_participant'
  root to: 'coordinators#home'
end
