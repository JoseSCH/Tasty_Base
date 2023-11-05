class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Relacionando el modelo user con su lista.
  has_many :user_list, dependent: :destroy #Si se elimina la cuenta, tambien su lista.
end
