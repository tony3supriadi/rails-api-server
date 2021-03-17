Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    get '/books' => 'book#index'
    post '/books' => 'book#create'
    get '/books/:id' => 'book#show'
  end
end
