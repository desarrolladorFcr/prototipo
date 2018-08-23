Rails.application.routes.draw do
  root 'perfil#index'
  resources :actividad_temas
  resources :recurso_adicionals
  resources :tipo_contenidos
  resources :tema_modulos
  resources :modulos
  resources :alumnos
  resources :areas
  resources :cursos
  #adm_panel
  get 'adm_panel/index'
  get 'adm_panel/prueba'
  get 'adm_panel/cerrar'
  get 'login/index'
  post 'login/ingreso'
  post 'login/recuperar'
  #login
  get 'login/salir'
  #Perfil
  get 'perfil/hola'
end
