class ApplicationController < ActionController::Base
  #Seguridad
  protect_from_forgery with: :exception
end
