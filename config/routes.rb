Rails.application.routes.draw do
  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
  get 'me', controller: :users, action: :me
  # post 'new_resume', controller: :resumes, action: :create
  resources :resumes
  # resources :skills
  # resources :educations
  # resources :experinces

end
