class VacationController < ApplicationController
  def list
    @vacations = Vacation.all
    #render("vacation/list")
    @a = "you tell me!"
  end
end
