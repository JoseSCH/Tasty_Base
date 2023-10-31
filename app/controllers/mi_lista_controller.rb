class MiListaController < ApplicationController
  before_action :authenticate_user!

  def lista
    #Listar las recetas que ha agregado el usuario.
    @user_list = current_user.user_list
  end

  #Crear item en lista.
  def create
    item = UserList.new(recipe_params)

    #Guarda un item a la lista.
    if item.save
      redirect_to show_details_path(id: item.idMeal)
      flash[:notice] = "Se ha agregado #{item.recipe_name} a su lista con exito."
    else
      redirect_to show_details_path(id: item.idMeal)
      flash[:alert] = "No se ha podido guardar #{item.recipe_name} en lista."
    end
  end

  #Eliminar item en lista.
  def delete
    item = UserList.find_by(user_id: current_user.id, idMeal: params[:idMeal])

    #Eliminar un item a la lista.
    if item.delete
      redirect_to show_details_path(id: item.idMeal)
      flash[:notice] = "Se ha eliminado #{item.recipe_name} de su lista con exito."
    else
      redirect_to show_details_path(id: item.idMeal)
      flash[:alert] = "No se ha podido eliminar #{item.recipe_name} de la lista."
    end
  end

  def delete_from_my_list
    item = UserList.find_by(user_id: current_user.id, idMeal: params[:idMeal])

    #Eliminar un item a la lista.
    if item.delete
      redirect_to mi_lista_path
      flash[:notice] = "Se ha eliminado #{item.recipe_name} de su lista con exito."
    else
      redirect_to mi_lista_path
      flash[:alert] = "No se ha podido eliminar #{item.recipe_name} de la lista."
    end
  end

  private

  #Que parametros permitir.
  def recipe_params
    params.require(:user_list).permit(:user_id, :idMeal, :recipe_name)
  end
end
