class Spud::Admin::Printers::JobsController < Spud::Admin::ApplicationController
	layout '/spud/admin/detail'
	belongs_to_spud_app :printers
	before_filter :load_printer
	before_filter :load_job,:only => [:show,:edit,:update,:destroy]
	add_breadcrumb "Printers", :spud_admin_printers_path



	def index
		add_breadcrumb "#{@printer.name}", :spud_admin_printer_jobs_path
		@page_name = "Print Jobs For - #{@printer.name}"
		@jobs = @printer.active_jobs.paginate(:page => params[:page])
		respond_with @jobs
	end

	def show
	end

	def update
	end

	def destroy
		flash[:notice] = "Job removed successfully!" if @job.destroy
		respond_with @job,:location => spud_admin_printer_jobs_path()
	end	
private

	def load_printer
		if !params[:printer_id].blank?
			@printer = SpudPrinter.find(params[:printer_id])
		end
	end

	def load_job
		@job = SpudPrintJob.find(params[:id])
		if @job.blank?
			flash[:error] = "Unable to load spud print job"
			redirect_to :back and return
		end

	end
end
