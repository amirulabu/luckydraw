class PagesController < ApplicationController

  @@totalwinner = 0

  def index
  	@people = Person.where('winner != ?', 0)
    @people = @people.order("winner ASC")
    @@totalwinner = @people.count
    #if @lucky_person != nil
      @lucky_person = @people.order("winner ASC").first
    #end
  end

  def thechoosen
    require_super_admin
    @lucky_person = Person.all.shuffle.first
    @@totalwinner = 40 - @@totalwinner
    @lucky_person.winner = @@totalwinner
    @lucky_person.save
    params[:id] = @lucky_person.id

  end

  def show
  	@people = Person.paginate(page: params[:page], per_page: 30)
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