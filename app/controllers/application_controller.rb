require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    if logged_in?
      erb :'users/show'
    else
      erb :'index/index'
    
    end
  end

  helpers do 
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id:session[:user_id]) if session[:user_id]
    end

    def logout 
      session.clear
    end
  end
end
