class PagesController < ApplicationController

  def index
  end

  def explorer
  end

  def ajax_test
    #declare/init a ruby array
    found_array ||= []

    #call the C api
    data_from_api = dv_test

    #iterate the returned ruby hash
    data_from_api.each do |key,value|
       found_array << value
    end

    #pass the array back to the js call
    render :json => found_array 
  end

  def ajax_get_url
    #declare/init a ruby array
    found_array ||= []

    #call the C api
    data_from_api = dv_get_graph

    #iterate the returned ruby hash
    data_from_api.each do |key,value|
       found_array << value
    end

    #pass the array back to the js call
    render :json => found_array
  end

end
