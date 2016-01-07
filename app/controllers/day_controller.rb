class DayController < ApplicationController
  
  def random
  end
  
  def show
  	@day = view_context.GetDay(params[:categories])
  	respond_to do |format|
  		format.html # show.html.erb
  		format.json  { render :json => @day }
  		format.xml  { render :xml => @day }
  	end
  end

end
