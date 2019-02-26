Rails.application.routes.draw do

  root to: 'pages#index'

  post "/pages/ajax_test" => "pages#ajax_test"

end
