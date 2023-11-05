class UserList < ApplicationRecord

  #Relacion entre el modelo user_list hacia usuarios.
  belongs_to :user
end
