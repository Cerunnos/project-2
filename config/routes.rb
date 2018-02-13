Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  resources :users
  resources :quizzes
  resources :questions do
    resources :answers
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/quizzes/:quiz_id/take_quiz', to: 'quizzes#take_quiz'
  post '/quizzes/:quiz_id/take_quiz', to: 'quizzes#grade_quiz'
end
