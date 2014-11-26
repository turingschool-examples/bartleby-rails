Rails.application.routes.draw do
  resources :notes, defaults: { format: 'json' }, path: 'api/notes'
end
