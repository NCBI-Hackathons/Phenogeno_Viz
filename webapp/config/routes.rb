Rails.application.routes.draw do

  root to:"pages#index"

  get "/pages/:explore" =>"pages#explorer"

  post "/pages/ajax_get_url" => "pages#ajax_get_url"

end
