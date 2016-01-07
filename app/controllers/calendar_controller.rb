class CalendarController < ApplicationController
  def calendar
  	@Categories = Category.all
  end
end
