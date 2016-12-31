class PagesController < ApplicationController
  def index
  	@persons = Person.all.shuffle

  	if user_signed_in?
  		@lucky_person = Person.all.shuffle.first
  	end
  end

end