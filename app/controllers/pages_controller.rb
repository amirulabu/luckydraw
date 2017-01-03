class PagesController < ApplicationController

  def index
  	@people = Winner.order("created_at DESC").all
    if Winner.last != nil
      @lucky_person = Winner.last
    end
  end

  def thechoosen
    if current_user.super_admin? and Winner.count < 40
      @lucky_person = Person.all.shuffle.first
      @winner = Winner.create(name: @lucky_person.name, petid: @lucky_person.petid)
      @lucky_person.destroy
      respond_to do |format|
        format.json { render :json => @lucky_person.to_json }
        format.js { render :json => @lucky_person.to_json }
        format.html { redirect_to root_path }
      end
    elsif Winner.count >= 40 
      flash[:alert] = "Only 40 prizes"
      respond_to do |format|
        format.json { render :json => {} }
        format.js { }
        format.html { redirect_to root_path }
      end
    else 
      flash[:alert] = "Only admins can perform that action"
      redirect_to root_path
    end
  end

  def show
  	@people = Person.order("name ASC").paginate(page: params[:page], per_page: 30)
  end


    private

  def user_params
    params.require(:person).permit(:username, :email, :password)
  end


end