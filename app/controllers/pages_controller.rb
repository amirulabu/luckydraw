class PagesController < ApplicationController

  def index
  	@people = Winner.order("created_at DESC").all
    if Winner.last != nil
      @lucky_person = Winner.last
    end
  end

  def thechoosen
    require_super_admin
    @lucky_person = Person.all.shuffle.first
    @winner = Winner.create(name: @lucky_person.name, petid: @lucky_person.petid)
    @lucky_person.destroy
  end

  def show
  	@people = Person.order("name ASC").paginate(page: params[:page], per_page: 30)
  end


    private

  def user_params
    params.require(:person).permit(:username, :email, :password)
  end

  def require_super_admin
    if user_signed_in? && current_user.super_admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end

end