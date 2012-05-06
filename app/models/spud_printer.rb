require 'digest/sha1'
class SpudPrinter < ActiveRecord::Base
	has_many :spud_print_jobs
	has_many :active_jobs,:class_name => "SpudPrintJob",:foreign_key => :spud_printer_id,:conditions => "spud_print_jobs.status = 0"
	validates :name, :presence => true, :uniqueness => true
	validates :access_token, :presence=>true, :uniqueness=>true

	before_validation :generate_access_token

private
	def generate_access_token
		return if !self.access_token.blank?
		self.access_token = Digest::SHA1.hexdigest(Time.now.to_s)
	end
end
