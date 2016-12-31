class PagesController < ApplicationController
  def index
  	@people = Person.all.shuffle

  	if user_signed_in?
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

  def show
  	@people = Person.all.sort
  end

end