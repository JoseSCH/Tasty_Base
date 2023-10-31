Rails.application.routes.draw do
  root 'index#index'
  #Rutas para usuarios.
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :meals do
    collection do
      get 'categories'
      get 'recipes/:category', action: 'recipes_by_category', as: 'recipes_by_category'
    end
  end
  #Para mostrar 5 recetas aleatorias
  get 'aleatorio/recetas_aleatorias', to: 'aleatorio#recetas_aleatorias', as: 'aleatorias'
  #Para buscar recetas
  get 'buscar', to: 'busqueda#buscar', as: 'buscar'
  #Para mostrar el detalle de una receta.
  get 'mostrar_detalles/detalles', as: 'show_details'

  #Para listar las recetas que el usuario haya guardado.
  get 'mi_lista/lista', as: 'mi_lista'

  #Para realizar la peticion post para guardar y eliminar un item en lista.
  post 'mi_lista/create', as: 'guardar_item'
  post 'mi_lista/delete', to: 'mi_lista#delete', via: :delete, as: 'eliminar_item'

  #Eliminar desde al vista de la lista de cada usuario.
  delete 'mi_lista/delete_from_my_list', to: 'mi_lista#delete_from_my_list', via: :delete, as: 'eliminar_item_from'

  # Defines the root path route ("/")
  # root "posts#index"
end
