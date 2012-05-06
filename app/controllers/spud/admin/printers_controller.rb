class Spud::Admin::PrintersController < Spud::Admin::ApplicationController
	layout '/spud/admin/detail'
	belongs_to_spud_app :printers
	add_breadcrumb "Printers", :spud_admin_printers_path

	before_filter :load_printer,:only => [:edit,:update,:show,:destroy]
	def index
		@printers = SpudPrinter.order(:name).paginate :page => params[:page]
		respond_with @printers
	end

	def new
		add_breadcrumb "New", :new_spud_admin_printer_path
		@printer = SpudPrinter.new
		respond_with @printer
	end

	def create
		add_breadcrumb "New", :new_spud_admin_printer_path

		@printer = SpudPrinter.new(params[:spud_printer])

		if @printer.save
			flash[:notice] = "Printer added successfully!"
		else
			flash[:error] = "Error saving printer!"
		end

		respond_with @printer,:location => spud_admin_printers_url
	end

	def edit
		add_breadcrumb "Edit", :edit_spud_admin_printer_path

		respond_with @printer
	end

	def update
		add_breadcrumb "Edit", :edit_spud_admin_printer_path

		if @printer.update_attributes(params[:spud_printer])
			flash[:notice] = "Printer updated successfully!"
		else
			flash[:error] = "Error saving printer!"
		end
		respond_with @printer,:location => spud_admin_printers_url
	end

	def destroy

		flash[:notice] = "Printer removed!" if @printer.destroy

		respond_with @printer,:location => spud_admin_printers_url
	end

private
	def load_printer
		@printer = SpudPrinter.find(params[:id])
		if @printer.blank?
			flash[:error] = "Printer not found!"
			redirect_to spud_admin_printers_url and return
		end
	end
end
