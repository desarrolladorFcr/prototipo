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
  #usuarios
  get 'usuarios/universidad'
  get 'usuarios/profesor'
  get 'usuarios/conf_universidad'
  post 'usuarios/crea_usuario'
  post 'usuarios/usuario_data'

  #login
  get 'login/salir'
  get 'login/index'
  post 'login/ingreso'
  post 'login/recuperar'
  get 'login/nuevapsw'
  post 'login/cambio'
  #Perfil
  get 'perfil/mis_cursos'
  get 'perfil/cursos'
  #Api
  get 'cursos_api/index'
end
