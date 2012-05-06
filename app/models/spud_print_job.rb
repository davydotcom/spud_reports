class SpudPrintJob < ActiveRecord::Base
	belongs_to :spud_printer
	belongs_to :spud_user
end
