class PagesController < ApplicationController
  def index
  	@people = Person.all

  	if user_signed_in? && current_user.super_admin?
  		@lucky_person = Person.all.shuffle.first
  		@lucky_person_petid = ""
  		@lucky_person.petid.each_char.with_index do |i,index|
  			if index >= 3
  				@lucky_person_petid << i
  			elsif index < 3
  				@lucky_person_petid << "*"
  			end
  		end

  	end

  end

  def thechoosen
    @person = Person.find(params[:id])
  end

  def show
  	@people = Person.all.sort
  end

end