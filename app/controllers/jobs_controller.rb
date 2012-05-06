class JobsController < ApplicationController
	def index
		@printers = SpudPrinter.where(:access_token => params[:keys]).includes(:active_jobs).all

		

	end

end
