class JobsController < Spud::ApplicationController
	def index

		trys = 0
		while(trys < 30)
			SpudPrinter.uncached do
				@printers = SpudPrinter.where(:access_token => params[:keys]).includes(:active_jobs).all
				job_count = 0
				puts "printer query each method"
				@printers.each do |printer|
					puts("Checking job count on printer")
					job_count = 0
					printer.active_jobs.all.each do |job|
						if File.exist?(File.join(Rails.root,'public','report_jobs',job.attachment_file_name))
							job_count += 1
						else
							job.update_attributes(:status => 1)
						end
					end
					puts(job_count)
				end
				if job_count > 0
					render and return
				end
				sleep 1
				trys += 1
			end
		end
	end

	def show
		@job = SpudPrintJob.find(params[:id])
		if !@job.blank?
			@job.update_attributes(:status => 1)
			File.delete(File.join(Rails.root,'public','report_jobs',@job.attachment_file_name))
		end
		render :status => 200,:text => nil
	end

	def update
		@job = SpudPrintJob.find(params[:id])
		if @job
			if @job.spud_printer.key == params[:key]
				@job.status = 1
				#TODO DELETE ATTACHMENT_FILE
				@job.save
				render :text => nil,:status => 200 and return
			end
		end
		render :text => nil,:status => 500
	end


end
