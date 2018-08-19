class SessionsController < ApplicationController
  def new
  end

  def create
   return redirect_to(controller: 'sessions', action: 'new') if !params[:name] || params[:name].empty?
   session[:name] = params[:name]
   redirect_to controller: 'application', action: 'hello'
  end
    # if session[:name]
    #   redirect_to '/'
    # else
    #   session[:name] = params[:name]
    #   redirect_to sessions_new_path
    # end

  def destroy
    session.delete :name
    redirect_to '/'
  end

  private

    def okay_params
      params.require(:name)
    end

end
