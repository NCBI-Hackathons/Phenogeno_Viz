Rails.application.routes.draw do

  root to: 'pages#index'

  post "/pages/ajax_get_url" => "pages#ajax_get_url"

end
